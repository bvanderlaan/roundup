class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :rsvps
  has_many :events, through: :rsvps

  has_secure_password
  before_save { self.email = email.downcase }
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email, 
  			presence: true,
            length: { maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :password,
  			length: { minimum: 6 },
        allow_nil: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
