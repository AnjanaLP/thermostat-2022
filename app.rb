require 'sinatra/base'
require './lib/thermostat'
require 'json'

class ThermostatApp < Sinatra::Base

  get '/' do
    File.read('public/index.html')
  end

  get '/temperature' do
    thermostat = Thermostat.new
    { temperature: thermostat.temperature }.to_json
  end

  run! if app_file == $0
end
