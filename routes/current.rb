get '/current' do
	weather = Weather.new
	@temp = weather.getTemp
	@wind = weather.getWind
	@humidity = weather.getHumidity
	@city = weather.getCity
	@zip = weather.getZip
	@outside = weather.getDescription

	haml :current
end