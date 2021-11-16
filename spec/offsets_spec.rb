require './spec/spec_helper'
require './lib/random_number'
require './lib/offsets'

RSpec.describe Offsets do
  before(:each) do
    @random_number = RandomNumber.new
    @offsets = Offsets.new('100221')
  end

  it 'exists' do
    expect(@offsets).to be_an_instance_of(Offsets)
  end

  it 'reads the date' do
    expect(@offsets.date).to eq('100221')
  end

  it '#make_offsets' do
    expected = {
      "A" => "8",
      "B" => "8",
      "C" => "4",
      "D" => "1"
    }

    expect(@offsets.make_offsets).to eq(expected)
  end


end
