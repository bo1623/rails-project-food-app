class Restaurant < ApplicationRecord
  has_many :dishes
  has_many :meals, through: :dishes
  has_many :users, through: :meals
  belongs_to :corporation
  belongs_to :location
  accepts_nested_attributes_for :dishes

  def cuisine #for the show page
    self.corporation.cuisine
  end

end
