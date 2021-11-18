
class Key

  attr_reader :key_string

  def initialize(random_number)
    @key_string = random_number.rand_num
  end

end
