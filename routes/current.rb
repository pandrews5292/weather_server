$weather = Weather.new

get '/current' do
	
	@temp = $weather.getTemp
	@wind = $weather.getWind
	@humidity = $weather.getHumidity
	@area = $weather.getArea
	@zip = $weather.getZip
	@outside = $weather.getDescription

	@current_tab = 'active'
	@forecast_tab = ''
	@radar_tab = ''

	logRequestInfo(request)

	haml :current
end

post '/current' do

	@current_tab = 'active'
	@forecast_tab = ''
	@radar_tab = ''

	$weather.setZip(params['zipcode'])

	@area = $weather.getArea
	if @area == 'bad_area'
		@area = "Unknown Location"
		@temp = "N/A"
		@wind = "N/A"
		@humidity = "N/A"
		@zip = "N/A"
		@outside = "N/A"
	else

		@temp = $weather.getTemp
		@wind = $weather.getWind
		@humidity = $weather.getHumidity
		
		@zip = $weather.getZip
		@outside = $weather.getDescription
	end

	logRequestInfo(request)

	haml :current

end


def logRequestInfo(request)
	logger.info("Scheme: " + request.scheme)
	logger.info("Method: " + request.request_method)
	logger.info("Port: " + request.port.to_s)
	logger.info("Path: " + request.path)
	logger.info("Client IP: " + request.ip)
	logger.info("Secure: " + request.secure?.to_s)
end