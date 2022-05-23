class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_search, only: [:index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  def search
    # # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # # if params[:q] && params[:q][:name]と同じような意味合い
    # if params[:q]&.dig(:text,:age,:material,:making)
    #   # squishメソッドで余分なスペースを削除する
    #   squished_keywords = params[:q][:text][:age][:material][:making].squish
    #   ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
    #   params[:q][:text_cont_any][:age_cont_any][:material_cont_any][:making_cont_any] = squished_keywords.split(" ")
    # end
    set_search
  end

  private

  def item_params
    params.require(:item).permit(:age, :text, :image, :material, :making).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_search
    @q = Item.ransack(params[:q])
    @search_item = @q.result.order('created_at DESC')
  end
end
