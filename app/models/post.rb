class Post < ActiveRecord::Base
  acts_as_taggable
  
  before_save :render_body

  validates :title, :presence => true
  validates :body, :presence => true
  validates_presence_of :published_at, :if => :published
  validates :user_id, :presence => true
  
  belongs_to :user
  belongs_to :category

  has_many :comments, :dependent => :destroy
  
  default_scope :order => 'posts.created_at DESC'
  
  attr_accessor :tag

  def render_body
    require 'redcarpet'
    options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    self.rendered_body = Redcarpet.new(self.body, *options).to_html
  end
  
  def is_author?
    author
  end
  def self.search(query)
    search_condition = "%" + query + "%"
    find(:all, :conditions => ['title LIKE ? OR body LIKE ?', search_condition, search_condition])
  end
end

