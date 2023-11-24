class Rent < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]
  validates :start_date, :end_date, presence: true

  belongs_to :coworking
  belongs_to :user
end
