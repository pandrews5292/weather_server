get '/current' do
	weather = Weather.new
	@temp = weather.getTemp
	@wind = weather.getWind
	@humidity = weather.getHumidity
	@area = weather.getArea
	@zip = weather.getZip
	@outside = weather.getDescription

	@current_tab = 'active'
	@forecast_tab = ''
	@radar_tab = ''
	@network_tab = ''

	haml :current
end

post '/current' do
	weather = Weather.new
	weather.setZip(params['zipcode'])

	@area = weather.getArea
	if @area == 'bad_area'
		@area = "Unknown Location"
		@temp = "N/A"
		@wind = "N/A"
		@humidity = "N/A"
		@zip = "N/A"
		@outside = "N/A"
	else

		@temp = weather.getTemp
		@wind = weather.getWind
		@humidity = weather.getHumidity
		
		@zip = weather.getZip
		@outside = weather.getDescription
	end

	haml :current

end