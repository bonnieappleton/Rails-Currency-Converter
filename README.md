# Currency Converter

This is a ruby on rails app, which provides a form where you can enter a price
and convert it from one currency to another.

## About

Rate model contains fields for date, currency and rate

The database of rates is updated daily by a cron job from
http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml

All code written by Bonnie Appleton

## Requirements

* Ruby 2.4.1 - can be installed from https://www.ruby-lang.org/en/downloads/
* Rails 5.1.4 - `gem install rails`

## How to use

### Start up a local server

Navigate to the currencyConverter folder and run `rails server`

### View the application

Open http://localhost:3000 in your browser

## Tasks

Tasks are in `lib/tasks`.

You can use `rake import:full_xml` to fully populate the database - the db in this
project is already populated.

You can use `rake import:daily_xml` to get today's rates. The latter is run as a
daily cron job, so you shouldn't need to run it.

## Future improvements

* [ ] I need a method outside of the controller for the exchange rate calculation. On the model?
* [ ] I wasn't sure how to update from store, so I did it from the feed
* [ ] Tests for the conversion functionality and creation of Rates
* [ ] Validation so that you cannot enter the same To/From currencies
* [ ] Validation to prevent entering future dates
* [ ] Currency/date combo should be unique in db
* [ ] Rates are not updated on the weekend, so set default date to last day with rates
* [ ] Add autoprefixer for flex and other css prefixes
