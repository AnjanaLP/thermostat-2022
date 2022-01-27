class Thermostat
  DEFAULT_TEMPERATURE = 20
  TEMPERATURE_CHANGE = 1
  MAX_PSM_ON_TEMPERATURE = 25
  MAX_PSM_OFF_TEMPERATURE = 32
  MIN_TEMPERATURE = 10
  MEDIUM_ENERGY_USAGE_LIMIT = 18
  HIGH_ENERGY_USAGE_LIMIT = 25

  attr_reader :temperature, :psm_status

  def self.instance
    @thermostat ||= self.new
  end

  def initialize
    @temperature = DEFAULT_TEMPERATURE
    @psm_status = "on"
  end

  def up
    @temperature += TEMPERATURE_CHANGE unless at_maximum_temperature?
  end

  def down
    @temperature -= TEMPERATURE_CHANGE unless at_minimum_temperature?
  end

  def reset
    @temperature = DEFAULT_TEMPERATURE
  end

  def switch_psm_off
    @psm_status = 'off'
  end

  def switch_psm_on
    @psm_status = 'on'
    @temperature = MAX_PSM_ON_TEMPERATURE if at_maximum_temperature?
  end

  def energy_usage
    if temperature < MEDIUM_ENERGY_USAGE_LIMIT
      'low-usage'
    elsif temperature <= HIGH_ENERGY_USAGE_LIMIT
      'medium-usage'
    else
      'high-usage'
    end
  end

  private

  def at_maximum_temperature?
    if psm_status == 'on'
      return true if temperature >= MAX_PSM_ON_TEMPERATURE
    else
      return true if temperature >= MAX_PSM_OFF_TEMPERATURE
    end
  end

  def at_minimum_temperature?
    temperature <= MIN_TEMPERATURE
  end
end
