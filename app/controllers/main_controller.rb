class MainController < ApplicationController
  
  def search
    search_result = Post.search do
    
      keywords params[:query]
    end.results
    @posts=Kaminari.paginate_array(search_result).page(params[:page]).per(5)
    @categories = Category.all
    @tags = Post.tag_counts_on(:tags)
  end
  
  def index
    @categories = Category.all
    @posts=Post.where(:published => true).page(params[:page]).per(5)
    @tags = Post.tag_counts_on(:tags)
  end
end