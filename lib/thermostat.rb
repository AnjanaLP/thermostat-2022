class Thermostat
  DEFAULT_TEMPERATURE = 20
  TEMPERATURE_CHANGE = 1

  attr_reader :temperature

  def self.instance
    @thermostat ||= self.new
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
  end

  def up
    @temperature += TEMPERATURE_CHANGE
  end
end
