class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :author, :admin, :active
  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  has_many :posts
  has_many :comments
  
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  
  def is_admin?
    admin
  end
  
  def is_author?
    author
  end
end
