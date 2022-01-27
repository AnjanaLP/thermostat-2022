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
      psm_status: thermostat.psm_status,
      status: 200
    }.to_json
  end

  post '/temperature' do
    thermostat = Thermostat.instance
    case params[:method]
    when "up"
      thermostat.up
    when "down"
      thermostat.down
    when "reset"
      thermostat.reset
    end
    { status: 200 }.to_json
  end

  post '/power-saving-mode' do
    thermostat = Thermostat.instance
    case params[:method]
    when "off"
      thermostat.switch_psm_off
    when "on"
      thermostat.switch_psm_on
    end
    { status: 200 }.to_json
  end

  run! if app_file == $0
end
