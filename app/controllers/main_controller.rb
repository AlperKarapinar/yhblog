class MainController < ApplicationController
  def index
    @categories = Category.all
    @posts=Post.where(:published => true).page(params[:page]).per(5)
    @tags = Post.tag_counts_on(:tags)
    @users = User.all
  end
  def search
    @posts = Post.search params[:query]
  end
end