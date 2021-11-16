require './spec/spec_helper'
require './lib/enigma'
require './lib/input'
require './lib/key'
require './lib/random_number'
require './lib/offsets'
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
    @random_number = RandomNumber.new
    @key = "23758"
    @keys = {
      "A" => "23",
      "B" => "37",
      "C" => "75",
      "D" => "58"
    }
    @offset = Offsets.new("161121").offsets
    expected = {
      encryption: 'jujqqputtab',
      key: @key,
      date: "161121"
    }

    expect(@enigma.applies_keys("hello world", @keys, @offset)).to eq(expected)
  end

  it '#encrypt' do
    @random_number = RandomNumber.new
    @key = "23758"
    @keys = {
      "A" => "23",
      "B" => "37",
      "C" => "75",
      "D" => "58"
    }
    @offset = Offsets.new("161121").offsets
    expected = {
      encryption: 'jujqqputtab',
      key: @key,
      date: "161121"
    }

    expect(@enigma.applies_keys("hello world", @keys, @offset)).to eq(expected)
  end

  it '#decodes' do
    @random_number = RandomNumber.new
    @key = Key.new(@random_number)
    @offset = Offsets.new(@date)
    test = @enigma.applies_keys("hello world", @key.keys, @offset.offsets)
    test = test[:encryption]
    expected = {
      decryption: "hello world",
      key: @key.random_number,
      date: @date
    }

    expect(@enigma.decodes(test, @key.keys, @offset.offsets)).to eq(expected)
  end

end
