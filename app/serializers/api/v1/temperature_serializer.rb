class Api::V1::TemperatureSerializer < ActiveModel::Serializer
  attributes :id, :city, :temperature, :type_temperature, :created_at
end