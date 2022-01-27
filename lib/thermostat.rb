class Thermostat
  DEFAULT_TEMPERATURE = 20
  TEMPERATURE_CHANGE = 1

  attr_reader :temperature, :psm_status

  def self.instance
    @thermostat ||= self.new
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
    @psm_status = "on"
  end

  def up
    @temperature += TEMPERATURE_CHANGE
  end

  def down
    @temperature -= TEMPERATURE_CHANGE
  end

  def reset
    @temperature = DEFAULT_TEMPERATURE
  end

  def switch_psm_off
    @psm_status = 'off'
  end

  def switch_psm_on
    @psm_status = 'on'
  end
end
