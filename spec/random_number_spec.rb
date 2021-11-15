require './spec/spec_helper'
require './lib/random_number'


RSpec.describe RandomNumber do

  before(:each) do
    @random_number = RandomNumber.new
  end

  it 'exists' do
    expect(@random_number).to be_an_instance_of(RandomNumber)
  end

  it 'provides randomized 5 digit number by default' do
    expect(@random_number.rand_num.length).to eq(5)
  end



end
