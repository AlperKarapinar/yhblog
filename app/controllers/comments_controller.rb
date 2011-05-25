class CommentsController < ApplicationController
  
  before_filter :require_author, :except => [:show]
  
  def create
    @post = Post.find(params[:post_id])
    
    @comment = @post.comments.create(params[:comment])
    @comment.update_attribute(:user_id, current_user.id)
    redirect_to author_post_path(@post) 
      
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if (@comment.user_id == current_user.id)
      @comment.destroy
      redirect_to author_post_path(@post)
    else
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'You do not have permission to delete this comment' }
        format.json { head :ok }
      end
    end
  end
  
end
