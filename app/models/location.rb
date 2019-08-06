class Location < ApplicationRecord
  has_many :restaurants
  has_many :corporations, through: :restaurants
end
