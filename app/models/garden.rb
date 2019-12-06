class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
