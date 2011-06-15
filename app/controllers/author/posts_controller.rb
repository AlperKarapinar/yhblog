class Author::PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  before_filter :require_author, :except => [:show, :index]

  def autocomplete_tag_name
    render json: Tag.where("name like '#{params[:q]}%'")
#    render :text => "css, wer, rty, yui, fgh"
  end
  
  def index
    @posts = Post.where(:user_id => current_user.id).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = current_user.posts.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.new
    @available_categories = Category.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
    @available_categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(params[:post])
    @post.published_at = Time.now if @post.published
    respond_to do |format|
      if @post.save
        format.html { redirect_to author_mypost_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = current_user.posts.find(params[:id])
    @post.published_at = Time.now if (params[:post][:published] && @post.published_at.nil?)
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to author_mypost_path(@post), notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    current_user.posts.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to author_myposts_path, notice: 'The post was deleted successfully' }
      format.json { head :ok }
    end
  end
end
