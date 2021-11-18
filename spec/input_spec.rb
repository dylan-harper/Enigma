require './lib/input'

RSpec.describe Input do

  date_time_instance = DateTime.now
  day = date_time_instance.day.to_s
  month = date_time_instance.month.to_s
  year = date_time_instance.year.to_s
  date = day + month + year[2] + year[3]

  before(:each) do
    @input = Input.new()
    @date = date
  end

  it 'exists' do
    expect(@input).to be_an_instance_of(Input)
  end

  it 'creates current date' do
    expect(@input.todays_date).to eq(@date)
  end

  it 'reads attributes' do
    expect(@input.date).to eq(@date)
    expect(@input.random_number).to be_an_instance_of(RandomNumber)
  end

end
