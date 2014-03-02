get '/network_traffic' do
	@current_tab = ''
	@forecast_tab = ''
	@radar_tab = ''
	@network_tab = 'active'

	haml :network_traffic

end