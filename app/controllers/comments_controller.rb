class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(params[:comment])
    @comment.update_attribute(:user_id, current_user.id)
    redirect_to author_post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to author_post_path(@post)
  end
  
end
