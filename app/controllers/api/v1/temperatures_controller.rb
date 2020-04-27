class Api::V1::TemperaturesController < ApplicationController
  def index
    temperatures = Temperature.all
    temperatures = apply_filters(temperatures) if params[:q].present?

    render(
      json: temperatures,
      each_serializer: Api::V1::TemperatureSerializer,
      status: :ok
    )
  end

  def min_temperature
    temperature = Temperature.all.min
    render(
      json: temperature,
      serializer: Api::V1::TemperatureSerializer,
      status: :ok
    )
  end

  private

  def apply_filters(temperatures)
    temperatures = temperatures.by_temperature if temperature_filter?
    temperatures = temperatures.by_creation_date if creation_filter?

    temperatures
  end

  def temperature_filter?
    params[:q] == 'temperature'
  end

  def creation_filter?
    params[:q] == 'creation_date'
  end
end