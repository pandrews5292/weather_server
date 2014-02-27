require 'net/http'
require 'rubygems'
require 'json'

class Weather
  #Weather information
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
    f = (9/5)*(t-273) + 32
    return f.round(1)
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
  
  def getDescription()
    data = fullWeather
    parsed = JSON.parse(data)
    t = parsed["weather"][0]["description"]
    return t
  end

  def fullWeather()
    data = Net::HTTP.get('api.openweathermap.org','/data/2.5/weather?q=Lancaster')
    return data
  end

  def displayAll()
    print "City: ",self.getCity,"\n"
    print "Zip Code: ",self.getZip,"\n"
    print "Temperature: ", self.getTemp," degrees F\n"
    print "Humidity: ", self.getHumidity,"%\n"
    print "Wind: ",self.getWind," mph\n"
    print "Looks like: ",self.getDescription,"\n"
  end
end

#w = Weather.new()
#w.displayAll








