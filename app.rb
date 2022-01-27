require 'sinatra/base'

class ThermostatApp < Sinatra::Base
  get '/' do
    "Welcome to Thermostat"
  end

  run! if app_file == $0
end
