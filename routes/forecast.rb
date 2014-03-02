get '/forecast' do
	@current_tab = ''
	@forecast_tab = 'active'
	@radar_tab = ''
	@network_tab = ''

	haml :forecast

end