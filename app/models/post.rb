class Post < ApplicationRecord
  has_many :cities
  has_many :comments
  has_many :restaurants, through: :cities

  validates :blog, presence: true
end
