require './spec/spec_helper'
require './lib/enigma'
require './lib/key'
require './lib/random_number'
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

  it 'encrypts and decrypts with no explicit date' do
    expected = {
      date: @date,
      encryption: "pkfaw!qdzry!*&^",
      key: "02715"
    }

    expect(@enigma.encrypt("HELLO!WORLD!*&^", "02715")).to eq(expected)
  end

  it 'encrypts and decrypts with no explicit date' do
    expected = {
      date: @date,
      decryption: "hello!world!*&^",
      key: "02715"
    }

    expect(@enigma.decrypt("pkfaw!qdzry!*&^", "02715")).to eq(expected)
  end

  it 'decrypts from a hash' do
    encrypted = {
      date: @date,
      encryption: "pkfaw!qdzry!*&^",
      key: "02715"
    }

    expected = {
      date: @date,
      decryption: "hello!world!*&^",
      key: "02715"
    }

    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to eq(expected)
  end

  it '#make_key_hash' do
    expected = {
      'A' => '02',
      'B' => '27',
      'C' => '71',
      'D' => '15'
    }

    expect(@enigma.make_key_hash("02715", {})).to eq(expected)
  end

  it '#make_offset_hash' do
    expected = {
      'A' => '1',
      'B' => '0',
      'C' => '2',
      'D' => '5'
    }

    expect(@enigma.make_offset_hash("1025", {})).to eq(expected)
  end

  it '#combine_hashes' do
    key_hash = {
      'A' => '02',
      'B' => '27',
      'C' => '71',
      'D' => '15'
    }

    offset_hash = {
      'A' => '1',
      'B' => '0',
      'C' => '2',
      'D' => '5'
    }

    expected = {
      'A' => '3',
      'B' => '27',
      'C' => '73',
      'D' => '20'
    }

    expect(@enigma.combine_hashes(key_hash, offset_hash, {})).to eq(expected)
  end

  it '#combine_key_offsets' do
    key = '02715'
    offset = '1025'
    key_hash = {
      'A' => '02',
      'B' => '27',
      'C' => '71',
      'D' => '15'
    }

    offset_hash = {
      'A' => '1',
      'B' => '0',
      'C' => '2',
      'D' => '5'
    }

    expected = {
      'A' => '3',
      'B' => '27',
      'C' => '73',
      'D' => '20'
    }

    expect(@enigma.combine_key_offset(key, offset, key_hash, offset_hash, {})).to eq(expected)
  end

  it 'move_encrypt' do
    characters_array = ['h', 'e', 'l', 'l', 'o',' ', 'w', 'o', 'r', 'l', 'd']
    combined = {
      'A' => '3',
      'B' => '27',
      'C' => '73',
      'D' => '20'
    }
    expected = ['k', 'e', 'd' , 'e', 'r',' ', 'o', 'h', 'u', 'l', 'w']

    expect(@enigma.move_encrypt(characters_array, combined, [])).to eq(expected)
  end

  it 'move_decrypt' do
    characters_array = ['k', 'e', 'd' , 'e', 'r',' ', 'o', 'h', 'u', 'l', 'w']
    combined = {
      'A' => '3',
      'B' => '27',
      'C' => '73',
      'D' => '20'
    }
    expected = ['h', 'e', 'l', 'l', 'o',' ', 'w', 'o', 'r', 'l', 'd']

    expect(@enigma.move_decrypt(characters_array, combined, [])).to eq(expected)
  end

end
