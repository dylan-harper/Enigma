require './spec/spec_helper'
require './lib/random_number'
require './lib/key'

RSpec.describe Key do

  before :each do
    @random_number = RandomNumber.new
    @key = Key.new(@random_number)

  end

  it 'exists' do
    expect(@key).to be_an_instance_of(Key)
  end

  it '#make_keys' do
    number = @random_number.rand_num.to_s
    expected =  {
      "A" => number[0] + number [1],
      "B" => number[1] + number [2],
      "C" => number[2] + number [3],
      "D" => number[3] + number [4]
    }

    expect(@key.make_keys).to eq(expected)
  end

  # it 'reads the keys' do
  #   expect(@key.keys).to eq(@random_number.rand_num)
  # end

  it 'reads keys' do
    number = @random_number.rand_num
    expected =  {
      "A" => number[0] + number [1],
      "B" => number[1] + number [2],
      "C" => number[2] + number [3],
      "D" => number[3] + number [4]
    }
    # expected = test_hash.transform_values { |value| value.to_i}
    expect(@key.keys).to eq(expected)
  end

end
