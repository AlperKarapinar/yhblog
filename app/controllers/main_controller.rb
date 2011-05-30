class MainController < ApplicationController
  def index
    @categories = Category.all
    @posts=Post.where(:published => true).page(params[:page]).per(5)
  end
end