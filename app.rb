require 'sinatra/base'

class ThermostatApp < Sinatra::Base
  get '/' do
    File.read('public/index.html')
  end

  run! if app_file == $0
end
