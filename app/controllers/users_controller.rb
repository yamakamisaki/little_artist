class UsersController < ApplicationController
  before_action :set_user,   only: [:show, :favorites]
  before_action :set_search, only: :show
  before_action :authenticate_user!, only: :favorites

  def show
    @search_user = @user.id
    @items = @user.items.page(params[:page]).per(9)
  end

  def favorites
    redirect_to root_path unless current_user.id 
    @favorites = Favorite.where(user_id: @user.id).all.page(params[:page]).per(9)
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
