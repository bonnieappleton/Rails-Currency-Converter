# Currency Converter

This is a ruby on rails app, which provides a form where you can enter a price and
convert it to another currency.

## About

Rate model contains fields for date, currency and rate

The database of rates is updated daily by a cron job from
http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml

## Requirements

* Ruby 2.4.1 - can be installed from https://www.ruby-lang.org/en/downloads/
* Rails 5.1.4 - installation below
* SQLite3 3.8.10.2 - can be installed from https://www.sqlite.org/

## Installation

All commands run from the currencyConverter directory

Install Rails:
`gem install rails`

Set up the database:
From the currencyConverter directory run
`rails db:migrate`

Start up a local server:
From the currencyConverter directory run
`rails server`

View the application:
Open http://localhost:3000 in your browser

## How to use



## To do

* [ ] Take input and calculate new price
* [ ] Display new price and old price
* [ ] Parse xml to get rates
* [ ] Update db with rates
* [ ] Set up task to update rates daily
* [ ] Style page(s)
* [ ] Tests


## Future improvements

* [ ] number_field_tag is not accepting decimals (I tried setting a step value)
* [ ] Validation so that you cannot enter the same To/From currencies
* [ ] Validation to prevent entering future dates



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
