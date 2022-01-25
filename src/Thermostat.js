class Thermostat{
  constructor() {
    this.DEFAULT_TEMPERATURE = 20;
    this._MIN_TEMPERATURE = 10;
    this._temperature = this.DEFAULT_TEMPERATURE;
    this._powerSavingMode = true;
  }

  getCurrentTemperature() {
    return this._temperature;
  }

  up() {
    this._temperature += 1
  }

  down() {
    if (this._isMinimumTemperature()) {
      return;
    }
    this._temperature -= 1;
  }

  isPowerSavingModeOn() {
    return this._powerSavingMode;
  }

  switchPowerSavingModeOff() {
    this._powerSavingMode = false;
  }

  switchPowerSavingModeOn() {
    this._powerSavingMode = true;
  }

  _isMinimumTemperature() {
    return this._temperature === this._MIN_TEMPERATURE;
  }
}
