class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 4 }
    validates :description, presence: true, length: { minimum: 10}
end
