class Restaurant < ApplicationRecord
  has_many :meals
  has_many :users, through: :meals
  belongs_to :corporation
  belongs_to :location
  accepts_nested_attributes_for :meals

  def cuisine #for the show page
    self.corporation.cuisine
  end

end
