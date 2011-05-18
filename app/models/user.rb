class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :author, :admin, :active
  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
