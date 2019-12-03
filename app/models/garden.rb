class Garden < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :description, presence: true
end
