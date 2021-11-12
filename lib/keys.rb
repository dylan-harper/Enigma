class Keys

  def initialize(number)
    @number = number
    @key = make_keys

  end

  def make_keys
    key_hash = {}
    number_string = @number.to_s
    key_hash["A"] = number_string[0] + number_string[1]
    key_hash["B"] = number_string[1] + number_string[2]
    key_hash["C"] = number_string[2] + number_string[3]
    key_hash["D"] = number_string[3] + number_string[4]
    key_hash
  end


end
