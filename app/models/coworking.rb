class Coworking < ApplicationRecord
  belongs_to :user
  validates :address, :title, :description, :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_location, against: [:address], using: { tsearch: { prefix: true } }
end
