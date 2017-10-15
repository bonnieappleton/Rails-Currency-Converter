class HomeController < ApplicationController
  def home
    @rates = Rate.all
    @currencies = (@rates.pluck(:currency).uniq - [nil]).sort
    if params[:amount]
      date = params[:date]
      @formatted_date = "#{date['year']}-#{date['month']}-#{date['day']}"
      @amount = params[:amount].to_f.round(2)
      @from = params[:from]
      @to = params[:to]
      @converted_amount = nil
      
      from_record = Rate.find_by(date: @formatted_date, currency: @from)
      to_record = Rate.find_by(date: @formatted_date, currency: @to)
      
      if from_record && to_record
        from_rate = from_record.rate
        to_rate = to_record.rate
        @converted_amount = (@amount * (to_rate / from_rate)).round(2)
      end
    end
  end
  
  def convert(params)
    
  end
end
