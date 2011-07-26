class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user 
  before_filter :get_authors_by_posts_count
  
  def get_authors_by_posts_count
    authors = Array.new
    User.authors.each{|u| authors << {:user => u, :posts_count => u.posts.where(:published => true).count}}
    @sorted_authors=authors.sort! {|a,b| a[:posts_count] <=> b[:posts_count]}.reverse
  end
  
  private
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
  
  def require_admin
    redirect_to root_path, notice: 'You are not an administrator and cannot access this page.' and return unless current_user.try(:is_admin?)
  end
  
  def require_author
    redirect_to root_path, notice: 'You are not an authorized user and cannot access this page.' and return unless current_user.try(:is_author?) 
  end
  
  def require_authenticated
    redirect_to root_path, notice: 'You are not an authorized user and cannot access this page.' and return unless current_user 
  end
end
