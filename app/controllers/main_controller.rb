class MainController < ApplicationController
  def index
    @categories = Category.all
    @posts=Post.where(:published => true).page(params[:page]).per(5)
    @tags = Post.tag_counts_on(:tags)
  end
end