class MainController < ApplicationController
  def index
    @posts=Post.where(:published => true).page(params[:page]).per(5)
    @users = User.all
  end
  def search
    @posts = Post.search params[:query]
  end
end