require './spec/spec_helper'
require './lib/enigma'
require './lib/input'
require 'date' #make class for date?

RSpec.describe Enigma do

  date_time_instance = DateTime.now
  day = date_time_instance.day.to_s
  month = date_time_instance.month.to_s
  year = date_time_instance.year.to_s
  date = day + month + year[2] + year[3]

  before(:each) do
    @date = date
    @input = Input.new("hello world")
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it 'inherits attributes from Input' do
    expect(@enigma.date).to eq(@date)
  end

end
