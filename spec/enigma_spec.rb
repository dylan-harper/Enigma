require './spec/spec_helper'
require './lib/enigma'
require './lib/input'
require 'date'

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

  it 'contains alphabet as attribute' do
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.alphabet).to eq(expected)
  end

  it '#applies_keys' do
    @key = @input.key
    @offset = @input.offset.offsets
    expected = {
      encryption: 'vhgobcrreoz',
      key: @key,
      date: @date
    }

    expect(@enigma.applies_keys("hello world", @key, @offset)).to eq(expected)
  end

  # it '#encrypt' do
  #   random_number = RandomNumber.new
  #   message = "hello world"
  #   key = Key.new(random_number).keys
  #   offset = Offsets.new(@date)
  #   expected = {
  #     encryption: 'x',
  #     key: key,
  #     date: offset.date
  #   }
  #
  #   expect(@enigma.encrypt(message, key, offset)).to eq(expected)
  # end


end
