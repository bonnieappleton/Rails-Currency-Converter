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

All commands run from the currencyConverter directory unless specified

Install Rails:
`gem install rails`

Set up the database:
`rails db:migrate`
From `/lib/tasks` run `rake import:full_xml` to populate the database

Start up a local server:
`rails server`

View the application:
Open http://localhost:3000 in your browser

## Future improvements

* [ ] I wasn't sure how to update from store, so I did it from the feed
* [ ] Tests for the conversion functionality
* [ ] number_field_tag is not accepting decimals (I tried setting a step value, but it didn't work)
* [ ] Validation so that you cannot enter the same To/From currencies
* [ ] Validation to prevent entering future dates
* [ ] Currency/date combo should be unique in db
* [ ] Rates are not updated on the weekend, so set default date to last day with rates
* [ ] Add autoprefixer for flex and other css prefixes
