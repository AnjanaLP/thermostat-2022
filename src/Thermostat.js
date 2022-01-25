class Thermostat{
  constructor() {
    this.DEFAULT_TEMPERATURE = 20;
    this._temperature = this.DEFAULT_TEMPERATURE;
  }

  getCurrentTemperature() {
    return this._temperature;
  }
}
