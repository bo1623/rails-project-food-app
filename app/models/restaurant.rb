class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :meals, through: :dishes
  # has_many :users, through: :meals
  belongs_to :location
  belongs_to :cuisine
  accepts_nested_attributes_for :dishes, allow_destroy: true, update_only: true, reject_if: proc{|attributes| attributes[:name].blank?}


end
