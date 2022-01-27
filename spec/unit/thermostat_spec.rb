require 'thermostat'

describe Thermostat do
  subject(:thermostat)  { described_class.new }

  describe '.instance' do
    context 'when a Thermostat instance does not exist' do
      it 'returns a new Thermostat instance' do
        expect(Thermostat.instance).to be_a Thermostat
      end
    end

    context 'when a Thermostat instance already exists' do
      it 'returns that instance' do
        instance = Thermostat.instance
        expect(Thermostat.instance).to eq instance
      end
    end
  end

  describe '#temperature' do
    it 'initially returns the default temperature' do
      expect(thermostat.temperature).to eq described_class::DEFAULT_TEMPERATURE
    end
  end

  describe '#up' do
    it 'increases the temperature' do
      expect { thermostat.up }.to change { thermostat.temperature }. by(described_class::TEMPERATURE_CHANGE)
    end
  end
end
