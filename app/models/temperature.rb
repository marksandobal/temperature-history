class Temperature < ApplicationRecord
  scope :by_temperature, -> { order(:temperature) }
  scope :by_creation_date, -> { order(:created_at) }
end