# Thermostat
A simple thermostat built in a test driven manner to meet the specification below.

## Specification
* Thermostat starts at 20 degrees
* You can increase the temperature with an up function
* You can decrease the temperature with a down function
* The minimum temperature is 10 degrees
* If power saving mode is on, the maximum temperature is 25 degrees
* If power saving mode is off, the maximum temperature is 32 degrees
* Power saving mode is on by default but it can also be turned off
* You can reset the temperature to 20 with a reset function
* You can ask about the thermostat's current energy usage: < 18 is low-usage, <= 25 is medium-usage, anything else is high-usage
* Low-usage will be indicated with green, medium-usage indicated with orange, high-usage indicated with red via an interface
* You can see the temperature of your city, London by default but you can select any other city
* All the settings should be saved if you close and reopen the browser

![Screenshot](https://i.imgur.com/tIDXPnc.png)

## Video demo
Visit https://i.imgur.com/dzCJxsq.mp4

## How to use locally

### Install project dependencies
Clone the repo to your local machine, change into the directory, then:
```
$ bundle install
```

### Run the app
```
$ rackup
```
Visit http://localhost:9292

### Run the tests
```
$ rspec
```

## Technologies used
* AJAX
* Capybara
* CSS
* HTML
* Jasmine
* JavaScript
* jQuery
* RSpec
* Ruby
* Selenium WebDriver
* Sinatra
