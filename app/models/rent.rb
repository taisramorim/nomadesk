class Rent < ApplicationRecord
  enum status: [:pending, :accepted, :rejected]

  belongs_to :coworking
  belongs_to :user
end
