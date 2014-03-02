require 'net/http'
require 'rubygems'
require 'json'
require 'xmlsimple'
require 'area'


class Weather
  #Weather information
  def initialize()
    @zip = '17603'
  end
  
  def getZip()
    return @zip
  end

  def setZip(zip)
    @zip = zip
  end
    
  def getArea()
    area = @zip.to_region
    if area == NIL
      return "bad_area"
    else
      return area
    end
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
    area = self.getArea
    data = Net::HTTP.get('api.openweathermap.org','/data/2.5/weather?q='+area)
    return data
  end

end

w = Weather.new
puts w.getArea









