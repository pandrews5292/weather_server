get '/radar' do
	@current_tab = ''
	@forecast_tab = ''
	@radar_tab = 'active'
	@network_tab = ''

	logRequestInfo(request)

	haml :radar

end

def logRequestInfo(request)
	logger.info("Scheme: " + request.scheme)
	logger.info("Method: " + request.request_method)
	logger.info("Port: " + request.port.to_s)
	logger.info("Path: " + request.path)
	logger.info("Client IP: " + request.ip)
	logger.info("Secure: " + request.secure?.to_s)
end