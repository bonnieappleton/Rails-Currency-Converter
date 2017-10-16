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
      @converted_amount = convert(@amount, @from, @to, @formatted_date)
    end
  end
  
  def convert(amount, from, to, date)
    from_record = Rate.find_by(date: date, currency: from)
    to_record = Rate.find_by(date: date, currency: to)
    result = nil
    if from_record && to_record
      from_rate = from_record.rate
      to_rate = to_record.rate
      result = (amount * (to_rate / from_rate)).round(2)
    end
    return result
  end
end
