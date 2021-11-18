require './spec/spec_helper'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do

  date_time_instance = DateTime.now
  day = date_time_instance.day.to_s
  month = date_time_instance.month.to_s
  year = date_time_instance.year.to_s
  date = day + month + year[2] + year[3]

  before(:each) do
    @date = date
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it 'inherits attributes from Input' do
    expect(@enigma.date).to eq(@date)
  end

  it 'has empty encryption/decryption by default' do
    expect(@enigma.encryption).to eq({})
    expect(@enigma.decryption).to eq({})
  end

  it 'contains alphabet as attribute' do
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    expect(@enigma.alphabet).to eq(expected)
  end

  it '#encrypt' do
    expected = {
      date: "040895",
      encryption: "keder!ohulw!*&^",
      key: "02715"
    }

    expect(@enigma.encrypt("HELLO!WORLD!*&^", "02715", "040895")).to eq(expected)
  end

  it '#decrypt' do
    expected = {
      date: "040895",
      decryption: "hello world",
      key: "02715"
    }

    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

end
