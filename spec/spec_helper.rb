require './app'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

Capybara.app = ThermostatApp
Capybara.server = :puma, { Silent: true }
Capybara.default_driver = :selenium
