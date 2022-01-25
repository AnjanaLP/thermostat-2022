class Thermostat{
  constructor() {
    this.DEFAULT_TEMPERATURE = 20;
    this._temperature = this.DEFAULT_TEMPERATURE;
  }

  getCurrentTemperature() {
    return this._temperature;
  }

  up() {
    this._temperature += 1
  }

  down() {
    this._temperature -= 1;
  }
}
