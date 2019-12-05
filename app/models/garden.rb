class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
