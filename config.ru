require './myapp'
require 'encrypted_cookie'
#require 'rack/csrf'

cookie_settings = {
        :key          => 'user-key',
        :path         => "/",
        :expire_after => 86400,             # In seconds, 1 day.
        :secret       => 'e355b32c2e54ae5b41925b0801074cff34d8be0a73cb66eaf8651621fea6de14',
        :secure       => true,
        :httponly     => true
     }

use Rack::Session::EncryptedCookie, cookie_settings
#use Rack::Csrf, raise: true

run Sinatra::Application