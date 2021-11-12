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

end
