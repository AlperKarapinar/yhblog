class CategoryPostsController < ApplicationController
  before_filter :find_current_category
  def index
    @posts = Post.where(:category_id => @current_category.id)
  end
  
  private
  def find_current_category
    @current_category = Category.find(params[:category_id])
  end
end