class Restaurant < ApplicationRecord
  has_many :meals
  has_many :users, through: :meals
  belongs_to :corporation
  belongs_to :location

  def cuisine
    self.corporation.cuisine
  end

end
