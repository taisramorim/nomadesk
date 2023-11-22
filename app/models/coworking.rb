class Coworking < ApplicationRecord
  belongs_to :user
  validates :address, :title, :description, :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
