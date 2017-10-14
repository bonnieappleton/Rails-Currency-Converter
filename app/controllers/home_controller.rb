class HomeController < ApplicationController
  def home
    @rates = Rate.all
    @currencies = @rates.pluck(:currency).uniq - [nil]
  end
  def convert
    puts "converting"
  end
end
