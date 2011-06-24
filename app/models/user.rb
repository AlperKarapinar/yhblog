class User < ActiveRecord::Base
  
  has_secure_password
  
  has_attached_file :photo, :styles => { :thumb=> "100x100#", :small => "150x150>", :medium => "300x300>", :large => "400x400>" },
    :url => "/:attachment/:id/:style/:basename.:extension",
    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension"
    
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :author, :admin, :photo
  
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  scope :authors, where(:author => true )
  
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  
  def is_admin?
    admin
  end
  
  def is_author?
    author
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
end