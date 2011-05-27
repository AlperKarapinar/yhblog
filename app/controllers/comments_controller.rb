class CommentsController < ApplicationController
  
  before_filter :require_authenticated
  
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(params[:comment])
    @comment.update_attribute(:user_id, current_user.id)
    redirect_to author_post_path(@post.user, @post) 
      
  end
end
