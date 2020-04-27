namespace :temperature do
  desc "TODO"
  task get_temperature_task: :environment do
    cities = ['Monterrey']
    ActiveRecord::Base.transaction do
      
      cities.each do |city|
        response = make_request(city)
        # get response_parsed and get data
        temperature = ''
        save_temperature(city, temperature)

      rescue StandardError => e
        puts e.messages
      end
    end
  end
end

def make_request(city)
  api = TemperatureApi.new
  api.make_request(city)
end

def save_temperature(city, temperature)
  Temperature.create!(city: city, temperature: temperature, type: 'C°')
end