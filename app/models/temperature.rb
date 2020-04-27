class Temperature < ApplicationRecord
  scope :by_temperature, -> { order(:temperature) }
  scope :by_creation_date, -> { order(:created_at) }

  def self.min_temperature
    self.find_by_sql("select * from temperatures
      where (temperature = (select min(temperature) from temperatures))"
    )
  end
end