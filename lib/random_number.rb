class RandomNumber #needs to be able to make 0 first digit

  attr_reader :rand_num

  def initialize
    @rand_num = randomize
  end

  def randomize
    first = rand(1..9).to_s #fix this 0
    second = rand(0..9).to_s
    third = rand(0..9).to_s
    fourth = rand(0..9).to_s
    fifth = rand(0..9).to_s

    joined_strings = first + second + third + fourth + fifth
    joined_strings
  end


end
