require './lib/input'

RSpec.describe Input do

  it 'exists' do
    @input = Input.new('hello world')

    expect(@input).to be_an_instance_of(Input)
  end

  it 'creates current date' do
    @input = Input.new('hello world')

    expect(@input.todays_date).to eq("161121")
  end

  it 'reads attributes' do
    @input = Input.new('hello world')

    expect(@input.message).to eq('hello world')
    expect(@input.date).to eq("161121")
    expect(@input.random_number).to be_an_instance_of(RandomNumber)
  end

end
