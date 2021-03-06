class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_search, only: [:index, :search]

  def index
    @items = Item.all.order('created_at DESC').page(params[:page]).per(12)
    @rund_items = Item.all.order("RAND()")
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
    @items = Item.all.order('created_at DESC')
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
    @search_item = @q.result.order('created_at DESC').page(params[:page]).per(12)
  end
end
