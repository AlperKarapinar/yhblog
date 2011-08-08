class Tag::TagsController < ApplicationController
  def index
    tags = Tagging.where(:tag_id => params[:tag])
    @posts = []
    tags.each do |tag|
      @posts << Post.find(tag.taggable_id)
    end
  end
end