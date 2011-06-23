class AuthorPostsController < ApplicationController
  before_filter :find_current_author
  def index
    @posts = @current_author.posts.where(:published => true).page(params[:page]).per(5)
  end
  
  def show
    @post = @current_author.posts.find(params[:id])
  end
  
  private
  def find_current_author
    @current_author = User.find(params[:author_id])
  end
end