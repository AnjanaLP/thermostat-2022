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

    context 'when power saving mode is on' do
      it 'temperature cannot be increased above the MAX_PSM_ON_TEMPERATURE' do
        6.times { thermostat.up }
        expect(thermostat.temperature).to eq described_class::MAX_PSM_ON_TEMPERATURE
      end
    end

    context 'when power saving mode is off' do
      it 'temperature cannot be increased above the MAX_PSM_OFF_TEMPERATURE' do
        thermostat.switch_psm_off
        13.times { thermostat.up }
        expect(thermostat.temperature).to eq described_class::MAX_PSM_OFF_TEMPERATURE
      end
    end
  end

  describe '#down' do
    it 'decreases the temperature' do
      expect { thermostat.down }.to change { thermostat.temperature }. by(-described_class::TEMPERATURE_CHANGE)
    end

    it 'temperature cannot be decreased below below the minimum temperature' do
      11.times { thermostat.down }
      expect(thermostat.temperature).to eq described_class::MIN_TEMPERATURE
    end
  end

  describe '#reset' do
    it 'resets the temperature to the default' do
      5.times { thermostat.down }
      thermostat.reset
      expect(thermostat.temperature).to eq described_class::DEFAULT_TEMPERATURE
    end
  end

  describe '#psm_status' do
    it "initially returns 'on'" do
      expect(thermostat.psm_status).to eq "on"
    end

    context 'when power saving mode is switched off' do
      it "returns 'off'" do
        thermostat.switch_psm_off
        expect(thermostat.psm_status).to eq "off"
      end
    end

    context 'when power saving mode is switched back on' do
      it "returns 'on'" do
        thermostat.switch_psm_off
        thermostat.switch_psm_on
        expect(thermostat.psm_status).to eq "on"
      end
    end
  end

  describe '#switch_psm_on' do
    context 'when the temperature is above the MAX_PSM_ON_TEMPERATURE' do
      it 'resets the temperature to the MAX_PSM_ON_TEMPERATURE' do
        thermostat.switch_psm_off
        10.times { thermostat.up }
        thermostat.switch_psm_on
        expect(thermostat.temperature).to eq described_class::MAX_PSM_ON_TEMPERATURE
      end
    end
  end

  describe '#energy_usage' do
    context 'when the temperature is below 18 degrees' do
      it 'is considered low-usage' do
        3.times { thermostat.down }
        expect(thermostat.energy_usage).to eq 'low-usage'
      end
    end

    context 'when the temperature is between 18 and 25 degrees' do
      it 'is considered medium-usage' do
        expect(thermostat.energy_usage).to eq 'medium-usage'
      end
    end

    context 'when the temperature is above 25 degrees' do
      it 'it is considered high-usage' do
        thermostat.switch_psm_off
        6.times { thermostat.up }
        expect(thermostat.energy_usage).to eq 'high-usage'
      end
    end
  end
end
