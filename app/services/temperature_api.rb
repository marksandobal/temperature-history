
class TemperatureApi
  def initialize(params ={})
    @city = params[:city]
    @appid = '3fc82b390a874c7c422510d5488b0722'
  end

  def process_request
    response = make_request
    response_build(response)
  end

  def make_request
    HTTParty.get(
      'https://api.openweathermap.org/data/2.5/weather',
      query: { 'q' => @city, 'appid' => @appid }
    )
  end

  def response_build(response)
    return { success: false } if !response.code.eql?(200)

    { success: true, response: build_params(response.parsed_response) }
  end

  def build_params(response)
    {
      main: {
        city: @city,
        temperature: response['main']['temp']
      }
    }
  end
end