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

    describe('when power saving mode is on', function() {
      it('the temperature cannot be increased above 25 degrees', function() {
        for (var i = 0; i < 6; i++) {
          thermostat.up();
        };
        expect(thermostat.getCurrentTemperature()).toEqual(25);
      });
    });

    describe('when power saving mode is off', function() {
      it('the temperature cannot be increased above 32 degrees', function() {
        thermostat.switchPowerSavingModeOff();
        for (var i = 0; i < 13; i++) {
          thermostat.up();
        };
        expect(thermostat.getCurrentTemperature()).toEqual(32);
      });
    });
  });

  describe('#down', function() {
    it('decreases the temperature', function() {
      thermostat.down();
      expect(thermostat.getCurrentTemperature()).toEqual(19);
    });

    describe('when the minimum temperature is reached', function() {
      it('the temperature cannot be decreased', function() {
        for (var i = 0; i < 11; i++) {
          thermostat.down();
        };
        expect(thermostat.getCurrentTemperature()).toEqual(10);
      });
    });
  });

  describe('#isPowerSavingModeOn', function() {
    it('initially returns true', function() {
      expect(thermostat.isPowerSavingModeOn()).toBe(true);
    });
  });

  describe('#switchPowerSavingModeOff', function() {
    it('switches power saving mode off', function() {
      thermostat.switchPowerSavingModeOff();
      expect(thermostat.isPowerSavingModeOn()).toBe(false);
    });
  });

  describe('#switchPowerSavingModeOn', function() {
    it('switches power saving mode on', function() {
      thermostat.switchPowerSavingModeOff();
      thermostat.switchPowerSavingModeOn();
      expect(thermostat.isPowerSavingModeOn()).toBe(true);
    });
  });
});
