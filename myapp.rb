require 'sinatra'
require 'encrypted_cookie'
require 'haml'
#require 'rack/csrf'

require File.join(File.dirname(__FILE__), 'api/weather')
require File.join(File.dirname(__FILE__), 'api/forecast')
require File.join(File.dirname(__FILE__), 'routes/init')

set :environment, :production
set :port, 80
set :bind, '155.68.145.129'

get '/' do
  redirect '/current'
end

