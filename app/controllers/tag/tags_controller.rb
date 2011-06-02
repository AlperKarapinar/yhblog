class Tag::TagsController < ApplicationController
  def index
    @posts = Post.tagged_with("#{params[:tag]}", :match_all => true)
  end
end