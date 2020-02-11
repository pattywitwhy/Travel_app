class Post < ApplicationRecord
  has_many :cities
  has_many :comments
end
