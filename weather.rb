require 'net/http'
require 'rubygems'
require 'json'

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
  
  def getTemp()
    data = fullWeather
    parsed = JSON.parse(data)
    t =  parsed["main"]["temp"]
    return t
  end
    
  def getHumidity()
    data = fullWeather
    parsed = JSON.parse(data)
    t = parsed["main"]["humidity"]
    return t
  end
  
  def getWind()
    data = fullWeather
    parsed = JSON.parse(data)
    t = parsed["wind"]["speed"]
    return t

  end

  def fullWeather()
    data = Net::HTTP.get('api.openweathermap.org','/data/2.5/weather?q=Lancaster')
    return data
  end
end

w = Weather.new()
#puts w.fullWeather
print "Temperature: ", w.getTemp,"\n"
print "Humidity: ", w.getHumidity,"\n"
print "Wind: ",w.getWind,"\n"






