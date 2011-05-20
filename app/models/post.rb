class Post < ActiveRecord::Base
  before_save :render_body

  validates :title, :presence => true
  validates :body, :presence => true
  validates_presence_of :published_at, :if => :published
  validates :user_id, :presence => true
  
  belongs_to :user

  def render_body
    self.rendered_body = RDiscount.new(self.body).to_html
  end
  
  def is_author?
    author
  end
  
end
