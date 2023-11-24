class Rent < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]
  validates :data, presence: true

  belongs_to :coworking
  belongs_to :user
end
