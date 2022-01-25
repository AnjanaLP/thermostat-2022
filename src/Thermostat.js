class Thermostat{
  constructor() {
    this._DEFAULT_TEMPERATURE = 20;
    this._MIN_TEMPERATURE = 10;
    this._MAX_PSM_ON_TEMPERATURE = 25;
    this._MAX_PSM_OFF_TEMPERATURE = 32;
    this._TEMPERATURE_CHANGE = 1;
    this._temperature = this._DEFAULT_TEMPERATURE;
    this._powerSavingMode = true;
  }

  getCurrentTemperature() {
    return this._temperature;
  }

  up() {
    if (this._isMaximumTemperature()) {
      return;
    }
    this._temperature += this._TEMPERATURE_CHANGE;
  }

  down() {
    if (this._isMinimumTemperature()) {
      return;
    }
    this._temperature -= this._TEMPERATURE_CHANGE;
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

  reset() {
    this._temperature = this._DEFAULT_TEMPERATURE;
  }

  _isMinimumTemperature() {
    return this._temperature === this._MIN_TEMPERATURE;
  }

  _isMaximumTemperature() {
     if (this.isPowerSavingModeOn()) {
       return this._temperature === this._MAX_PSM_ON_TEMPERATURE;
     }
     return this._temperature === this._MAX_PSM_OFF_TEMPERATURE;
   }
}
