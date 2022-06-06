class UsersController < ApplicationController
  before_action :set_user,   only: [:show, :favorites]
  before_action :set_search, only: :show

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @search_user = @user.id
    @items = @user.items.order('created_at DESC').page(params[:page]).per(12)
  end

  def favorites
    @favorites = Favorite.where(user_id: @user.id).all.order('created_at DESC').page(params[:page]).per(12)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_search
    @q = Item.ransack(params[:q])
    @item = @q.result
  end
end
