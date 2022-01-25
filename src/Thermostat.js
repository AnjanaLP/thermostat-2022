class Thermostat{
  constructor() {
    this.DEFAULT_TEMPERATURE = 20;
    this._MIN_TEMPERATURE = 10;
    this._temperature = this.DEFAULT_TEMPERATURE;
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

  _isMinimumTemperature() {
    return this._temperature === this._MIN_TEMPERATURE;
  }
}
