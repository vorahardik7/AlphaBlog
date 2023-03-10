require 'bcrypt'
class User < ApplicationRecord
    
    before_save { self.email = email.downcase } 
    has_many :articles, dependent: :destroy
    
    validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 3 , maximum: 25 }
    
    VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 105 }, format: { with: VALID_EMAIL_FORMAT }

    has_secure_password
end