class Post < ApplicationRecord
  has_many :cities
  has_many :comments

  validates :blog, presence: true
end
