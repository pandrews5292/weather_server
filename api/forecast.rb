require 'net/http'
require 'rubygems'
require 'json'
require 'xmlsimple'
require 'area'

class Forecast
  #Returns a seven day forecast
  def initialize
    #Retrieves and parses the 7-day forecast
    @zip = '17603'
    region = getArea
    @forecast = XmlSimple.xml_in(Net::HTTP.get('api.openweathermap.org','/data/2.5/forecast/daily?q='+region+'&mode=xml&units=metric&cnt=7'))
    @days = NIL
    
    #Creates a new Hash and merges @forecast with it
    myData = Hash.new()
    myData = myData.merge(@forecast)
    
    #Gets the keys in the Hash
    keys = myData.keys
    forecast = myData[keys[4]]
    
    #Gets a list of all the days ("time")
    @days = forecast[0]["time"]
  end

  def setZip(z)
    @zip = z
  end

  def getZip
    return @zip
  end
  
  def getInfo(myHash)
    #Gets the info for each day
    keys = myHash.keys
    day = myHash["day"]
    maxTemp = myHash["temperature"][0]["max"]
    maxTemp = (maxTemp.to_f*(9.to_f/5.to_f)) + 32

    minTemp = myHash["temperature"][0]["min"]
    minTemp = (minTemp.to_f*(9.to_f/5.to_f)) + 32


    wind = myHash["windSpeed"][0]["mps"]
    wind = wind.to_i*2.2369
    humidity = myHash["humidity"][0]["value"]
    description = myHash["clouds"][0]["value"]
    return [day, maxTemp.to_i, wind.round(1), humidity, description, minTemp.to_i]
  end

  def getDay(day)
    day_of_week = @days[day]
    return self.getInfo(day_of_week)
  end

    def getArea()
    area = @zip.to_region
    if area == NIL
      return "bad_area"
    else
      return area
    end
  end
end


