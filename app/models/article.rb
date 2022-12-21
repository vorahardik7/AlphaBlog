class Article < ApplicationRecord
    validates :title, length: { minimum: 4 }
    validates :description, length: { minimum: 10}
end
