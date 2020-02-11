class Post < ApplicationRecord
  has_many :cities
  has_many :comments
  has_many :restaurants, through: :cities
  has_many :activities, through: :cities

  validates :blog, presence: true
end
