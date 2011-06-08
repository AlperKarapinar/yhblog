def search
  @posts = Post.search params[:search]
end