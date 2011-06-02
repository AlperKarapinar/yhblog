class Post < ActiveRecord::Base
  acts_as_taggable
  
  before_save :render_body

  validates :title, :presence => true
  validates :body, :presence => true
  validates_presence_of :published_at, :if => :published
  validates :user_id, :presence => true
  
  belongs_to :user

  has_many :comments, :dependent => :destroy
  
  default_scope :order => 'posts.created_at DESC'
  attr_accessor :tag
  
  searchable do
    text :title, :default_boost => 2
    text :body
    time :updated_at       # for sorting by recent
    string :sort_title do  # for sorting by title, ignoring leading A/An/The
      title.downcase.gsub(/^(an?|the)/, '')
    end
    boolean :published, :using => :published?    

    def published?
      state == :published
    end  
  end

  def render_body
    self.rendered_body = RDiscount.new(self.body).to_html
  end
  
  def is_author?
    author
  end
end

