class RandomNumber

  attr_reader :rand_num

  def initialize
    @rand_num = randomize
  end

  def randomize
    first = rand(1..9).to_s
    second = rand(0..9).to_s
    third = rand(0..9).to_s
    fourth = rand(0..9).to_s
    fifth = rand(0..9).to_s

    joined_strings = first + second + third + fourth + fifth

    joined_digits = joined_strings.to_i

    joined_digits
  end


end
