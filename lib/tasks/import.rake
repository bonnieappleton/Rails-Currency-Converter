namespace :import do
  desc "Import currency exchange rates"

  task full_xml: :environment do
    require 'open-uri'
    
    ecb_doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))
    daily_rates = ecb_doc.xpath("//xmlns:Cube[@time]")
    daily_rates.each { |daily_rate|
      time = daily_rate["time"]
      puts time
      currency_rates = daily_rate.children
      currency_rates.each { |currency_rate|
        currency = currency_rate["currency"]
        rate = currency_rate["rate"]
        puts "Date: #{time}, Currency: #{currency}, Rate: #{rate}"
        Rate.create(date: "#{time}", currency: "#{currency}", rate: rate)
      }
    }
    
  end
end