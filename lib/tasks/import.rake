namespace :import do
  desc "Import currency exchange rates"

  task full_xml: :environment do
    require 'open-uri'
    
    ecb_doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
    daily_rates = ecb_doc.xpath("//xmlns:Cube[@time]")
    daily_rates.each { |daily_rate|
      time = daily_rate["time"]
      currency_rates = daily_rate.children
      currency_rates.each { |currency_rate|
        currency = currency_rate["currency"]
        rate = currency_rate["rate"]
        Rate.create(date: "#{time}", currency: "#{currency}", rate: rate)
      }
    }
  end
  
  task daily_xml: :environment do
    require 'open-uri'
    
    ecb_doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
    day_rates = ecb_doc.xpath("//xmlns:Cube[@time='2017-10-13']").first
    time = day_rates["time"]
    currency_rates = day_rates.children
    currency_rates.each { |currency_rate|
      currency = currency_rate["currency"]
      rate = currency_rate["rate"]
      Rate.create(date: "#{time}", currency: "#{currency}", rate: rate)
    }
  end
end