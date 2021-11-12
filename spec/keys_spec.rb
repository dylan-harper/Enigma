require './spec/spec_helper'
require './lib/random_number'
require './lib/keys'

RSpec.describe do

  before(:each) do
    @random_number = RandomNumber.new
    @keys = Keys.new(@random_number)
  end

  it 'creates keys from number' do
    expect(@keys).to be_an_instance_of(Keys)
  end

  it '#make_keys' do
    number = @random_number.rand_num.to_s
    expected =  {
      "A" => number[0] + number [1],
      "B" => number[1] + number [2],
      "C" => number[2] + number [3],
      "D" => number[3] + number [4]
    }
    expect(@keys.make_keys).to eq(expected)
  end

  it 'reads the random number' do
    expect(@keys.number.rand_num).to eq(@random_number.rand_num)
  end

  it 'reads keys' do
    number = @random_number.rand_num.to_s
    expected =  {
      "A" => number[0] + number [1],
      "B" => number[1] + number [2],
      "C" => number[2] + number [3],
      "D" => number[3] + number [4]
    }

    expect(@keys.keys).to eq(expected)
  end

end
