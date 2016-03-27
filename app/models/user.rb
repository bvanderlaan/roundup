class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :user_name, 
  			presence: true,
            length: { maximum: 72 },
            uniqueness: { case_sensitive: false }
  validates :email, 
  			presence: true,
            length: { maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  
end
