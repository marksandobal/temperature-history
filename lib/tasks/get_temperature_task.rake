namespace :temperature do
  desc "TODO"
  task get_temperature_task: :environment do
    cities = ['Monterrey']

    ActiveRecord::Base.transaction do
      cities.each do |city|
        response = request_temperature_api(city)

        if response[:success]
          data = response[:response][:main]
          save_temperature(data)
        end
      rescue StandardError => e
        puts e.message
      end
    end
  end
end

def request_temperature_api(city)
  api = TemperatureApi.new(city: city)
  api.process_request
end

def save_temperature(data)
  Temperature.create!(
    city: data[:city],
    temperature: data[:temperature],
    type_temperature: 'C°'
  )
end