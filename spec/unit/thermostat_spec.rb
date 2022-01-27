require 'thermostat'

describe Thermostat do
  subject(:thermostat)  { described_class.new }

  describe '#temperature' do
    it 'initially returns the default temperature' do
      expect(thermostat.temperature).to eq described_class::DEFAULT_TEMPERATURE
    end
  end
end
