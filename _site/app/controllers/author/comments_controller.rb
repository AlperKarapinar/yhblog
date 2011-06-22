class Author::CommentsController < ApplicationController
  before_filter :require_author
  
  before_filter :find_current_post
  
  def destroy
    @post.comments.find(params[:id]).destroy
    redirect_to author_mypost_path(@post)
  end
  
  private
  def find_current_post
    @post = current_user.posts.find(params[:mypost_id])
    redirect_to root_path, :notice => "You are not authorized to access this page." and return if @post.nil?
  end
end