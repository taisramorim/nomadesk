class Coworking < ApplicationRecord
  belongs_to :user
  validates :address, :title, :description, :price, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_location, against: [:address], using: { tsearch: { prefix: true } }
end
