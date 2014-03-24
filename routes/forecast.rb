require 'time'
require 'date'

$forecast = Forecast.new

get '/forecast' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(0)

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = get_today

	logRequestInfo(request)

	haml :forecast

end

post '/forecast' do
	@current_tab = 'active'
	@forecast_tab = ''
	@radar_tab = ''

	$forecast.setZip(params['zipcode'])

	@area = $forecast.getArea
	if @area == 'bad_area'
		@area = "Unknown Location"
		@maxTemp = "N/A"
		@wind = "N/A"
		@humidity = "N/A"
		@zip = "N/A"
		@outside = "N/A"
		@minTemp = "N/A"
	else
		weather = $forecast.getDay(0)

		@maxTemp = weather[1]
		@wind = weather[2]
		@humidity = weather[3]
		@area = $forecast.getArea
		@zip = $forecast.getZip
		@outside = weather[4]
		@minTemp = weather[5]

		@today = get_today
	end

	logRequestInfo(request)

	haml :forecast

end

get '/forecast/monday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(1))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Monday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/tuesday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(2))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Tuesday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/wednesday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(3))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Wednesday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/thursday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(4))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Thursday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/friday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(5))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Friday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/saturday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(6))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Saturday'

	logRequestInfo(request)

	haml :forecast
end

get '/forecast/sunday' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''

	weather = $forecast.getDay(set_wday(0))

	@maxTemp = weather[1]
	@wind = weather[2]
	@humidity = weather[3]
	@area = $forecast.getArea
	@zip = $forecast.getZip
	@outside = weather[4]
	@minTemp = weather[5]

	@today = 'Sunday'

	logRequestInfo(request)

	haml :forecast
end


def get_today
	days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	time = Time.new
	days[time.wday]
end

def set_wday(w)
	cur = w - Date.today.wday
	if cur < 0
		cur = 7 + cur
	end
	return cur
end

def logRequestInfo(request)
	logger.info("Scheme: " + request.scheme)
	logger.info("Method: " + request.request_method)
	logger.info("Port: " + request.port.to_s)
	logger.info("Path: " + request.path)
	logger.info("Client IP: " + request.ip)
	logger.info("Secure: " + request.secure?.to_s)
end


	