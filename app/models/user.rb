class User < ApplicationRecord  
  has_many :gossips
  has_many :comments
  belongs_to :city, optional: true
  
  validates :first_name, 
  presence: true,
  length: { minimum: 2 }
  validates :last_name, 
  presence: true,
  length: { minimum: 2 }
  validates :email, 
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, 
  numericality: { only_integer: true }
  
  has_secure_password

  validates :password_digest, 
  presence: true,
  length: { minimum: 6 }
  
  validates :password_confirmation, 
  presence: true
  
  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end

end



