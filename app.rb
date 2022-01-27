require 'sinatra/base'
require './lib/thermostat'
require 'json'

class ThermostatApp < Sinatra::Base

  get '/' do
    File.read('public/index.html')
  end

  get '/temperature' do
    thermostat = Thermostat.instance
    {
      temperature: thermostat.temperature,
      status: 200
    }.to_json
  end

  post '/temperature' do
    thermostat = Thermostat.instance
    thermostat.up
    { status: 200 }.to_json
  end
   
  run! if app_file == $0
end
