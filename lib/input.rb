require './lib/random_number'
require './lib/key'
require 'date'

class Input

  attr_reader :message, :random_number, :key, :date, :offset

  def initialize(message)
    @message = message
    @random_number = RandomNumber.new
    @key = Key.new(@random_number).keys
    @date = todays_date
    @offset = Offsets.new(@date)
  end

  def todays_date
    date_time_instance = DateTime.now
    day = date_time_instance.day.to_s
    month = date_time_instance.month.to_s
    year = date_time_instance.year.to_s
    date = day + month + year[2] + year[3]
  end

end
