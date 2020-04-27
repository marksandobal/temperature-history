
class TemperatureApi
  def initialize(params ={})
  end

  def make_request(city)
    url = "api.openweathermap.org/data/2.5/weather?q=#{city}&appid=3fc82b390a874c7c422510d5488b0722"
    HTTParty.get(
      'api.openweathermap.org/data/2.5/weather',
      query: { 'q' => city, 'appid' => '3fc82b390a874c7c422510d5488b0722' }
    )
  end
end