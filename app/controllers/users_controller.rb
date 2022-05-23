class UsersController < ApplicationController

  before_action :set_search, only: [:show]

  def show
    @user = User.find(params[:id])
    @search_user = @user.id
    @items = @user.items
  end

private

def set_search
  @q = Item.ransack(params[:q])
  @item = @q.result
end


end
