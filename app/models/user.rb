class User < ApplicationRecord
    
    has_many :articles
    validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 3 , maximum: 25 }
    VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 105 }, format: { with: VALID_EMAIL_FORMAT }
end