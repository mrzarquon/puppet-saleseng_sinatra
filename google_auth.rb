ENV['GOOGLE_AUTH_URL'] = "https://www.google.com/accounts/o8/site-xrds?hd=puppetlabs.com"
ENV['SESSION_SECRET'] = "supersecretpassword"

require 'rubygems'
require 'sinatra'
require 'sinatra/google-auth'


class App < Sinatra::Base
  register Sinatra::GoogleAuth

  def on_user(info)
    puts info.inspect
  end

  get '*' do
    authenticate
    'hello'
  end
end

App.new()
