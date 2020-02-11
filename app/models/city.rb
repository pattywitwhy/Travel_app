class City < ApplicationRecord
  belongs_to :post
  has_many :restaurants
end
