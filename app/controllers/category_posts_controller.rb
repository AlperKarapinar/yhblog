class CategoryPostsController < ApplicationController
  before_filter :find_current_category
  def index
    @posts = Post.where(:category_id => @current_category.id, :published => true).page(params[:page]).per(5)
  end
  
  private
  def find_current_category
    @current_category = Category.find(params[:category_id])
  end
end