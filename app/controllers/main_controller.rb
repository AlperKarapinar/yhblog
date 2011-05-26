class MainController < ApplicationController
  def index
    @posts=Post.where(:published => true).page(params[:page]).per(5)
  end
end