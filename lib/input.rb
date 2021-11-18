require './lib/random_number'
require './lib/key'
require './lib/offsets'
require 'date'

class Input

  attr_reader :message, :random_number, :key, :date

  def initialize()
    @random_number = RandomNumber.new
    @key = Key.new(@random_number).key_string
    @date = todays_date
  end

  def todays_date
    date_time_instance = DateTime.now
    day = date_time_instance.day.to_s
    month = date_time_instance.month.to_s
    year = date_time_instance.year.to_s
    date = day + month + year[2] + year[3]
  end

end
