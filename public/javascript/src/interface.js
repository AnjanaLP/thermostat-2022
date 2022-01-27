$(document).ready(function() {
  var thermostat = new Thermostat();
  updateTemperature();

  $('#temperature-up').click(function() {
    $.post('/temperature', { method: "up" }, function(res) {
      var data = JSON.parse(res);
      if (data.status == 200) {
      updateTemperature();
      }
    });
  });

  $('#temperature-down').click(function() {
    $.post('/temperature', { method: "down" }, function(res) {
      var data = JSON.parse(res);
      if (data.status == 200) {
        updateTemperature();
      }
    });
  });

  $('#temperature-reset').click(function() {
    thermostat.reset();
    updateTemperature();
  });

  $('#psm-on').click(function() {
    thermostat.switchPowerSavingModeOn();
    $('#psm-status').text('on');
    updateTemperature();
  });

  $('#psm-off').click(function() {
    thermostat.switchPowerSavingModeOff();
    $('#psm-status').text('off');
    updateTemperature();
  });

  displayWeather('London');

  $('#select-city').submit(function(event) {
    event.preventDefault();
    var city = $('#current-city').val();
    displayWeather(city);
  });

  function updateTemperature() {
    $.get('/temperature', function(res) {
      var data = JSON.parse(res)
      if (data.status == 200) {
        $('#temperature').text(data.temperature);
      }
    });
    $('#temperature').attr('class', thermostat.energyUsage());
  };

  function updateCityName(city) {
    $('#city-name').text(city);
  };

  function displayWeather(city) {
    var url = 'http://api.openweathermap.org/data/2.5/weather?q=' + city;
    var token = '&appid=32f322b21c5f51ca1a47dd3ff16918cb';
    var units = '&units=metric';
    $.get(url + token + units, function(data) {
      $('#city-temperature').text(data.main.temp);
    });
    updateCityName(city);
  };
});
