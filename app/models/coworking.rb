class Coworking < ApplicationRecord
  belongs_to :user
  validates :address, :title, :description, :price, presence: true
end
