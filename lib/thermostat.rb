class Thermostat
  DEFAULT_TEMPERATURE = 20
  attr_reader :temperature

  def initialize
    @temperature = DEFAULT_TEMPERATURE
  end
end
