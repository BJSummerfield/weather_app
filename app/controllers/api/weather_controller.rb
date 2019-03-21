class Api::WeatherController < ApplicationController
  def index
    chicago = "41.8781, -87.6298"
    new_york = "40.7128, -74.0060"
    city = "41.8781, -87.6298" if params[:city] == "chicago"
    city = "40.7128, -74.0060" if params[:city] == "new_york"
      
    

    response = HTTP.get("https://api.darksky.net/forecast/#{ENV["API_KEY"]}/#{city}?exclude=[minutely,hourly]")

    @weather = response.parse  
    render 'index.json.jbuilder' 

  end
end
