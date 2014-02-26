require 'sinatra'
require 'socket'

class Weather
  #Class that will return weather info
  def initialize()
    @city = 'Lancaster'
    @zip = '17603'
  end
  
  def getCity()
    return @city
  end
  
  def getZip()
    return @zip
  end
  
  def FullWeather()
    data = Net::HTTP.get('api.openweather.org','/data/2.5/weather?q=')












end
