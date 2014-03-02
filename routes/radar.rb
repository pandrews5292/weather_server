get '/radar' do
	@current_tab = ''
	@forecast_tab = ''
	@radar_tab = 'active'
	@network_tab = ''

	haml :radar

end