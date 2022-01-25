'use strict';

describe ('Thermostat', function(){
  var thermostat;

  beforeEach(function() {
    thermostat = new Thermostat();
  });

  describe('#getCurrentTemperature', function() {
    it('is initially returns the default temperature', function() {
      expect(thermostat.getCurrentTemperature()).toEqual(20);
    });
  });

  describe('#up', function() {
    it('increases the temperature', function() {
      thermostat.up()
      expect(thermostat.getCurrentTemperature()).toEqual(21);
    });
  });
});
