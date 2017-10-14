class HomeController < ApplicationController
  def home
    @rates = Rate.all
    @currencies = (@rates.pluck(:currency).uniq - [nil]).sort
    if params[:amount]
      date = params[:date]
      formatted_date = "#{date['year']}-#{date['month']}-#{date['day']}"
      amount = params[:amount]
      from = params[:from]
      to = params[:to]
      puts "Amount: #{amount}"
      puts "Date: #{formatted_date}"
      puts "From: #{from}"
      
      from_rate = Rate.find_by(date: formatted_date, currency: from).rate
      to_rate = Rate.find_by(date: formatted_date, currency: to).rate
      
      converted_amount = amount * (to_rate / from_rate)
      
      puts converted_amount
    end
  end
  
  def convert(params)
    
  end
end
