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

  it 'has a key_string' do
    expect(@key.key_string).to eq(@random_number.rand_num)
  end

end
