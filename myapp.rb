require 'sinatra'
require 'haml'

require File.join(File.dirname(__FILE__), 'api/weather')
require File.join(File.dirname(__FILE__), 'routes/init')

set :environment, :production
set :bind, '0.0.0.0'
set :port, 80

get '/' do
  redirect '/current'
end

get '/*' do 
	redirect '/current'
end

