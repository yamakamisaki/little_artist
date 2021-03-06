class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/items/#{@comment.item.id}"
    else
      @comments = @item.comments.includes(:user)
      render 'items/show'
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    if current_user.id == comment.user.id || current_user.id == @item.user.id
      comment.destroy
      redirect_to "/items/#{comment.item.id}"
    else
      render 'items/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
