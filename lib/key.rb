
class Key

  attr_reader :key_string#, :key_hash

  def initialize(random_number)
    @key_string = random_number.rand_num
    # @key_hash = make_keys
  end

  def make_keys
    keys_hash = {}

    keys_hash["A"] = @key_string[0] + @key_string[1]
    keys_hash["B"] = @key_string[1] + @key_string[2]
    keys_hash["C"] = @key_string[2] + @key_string[3]
    keys_hash["D"] = @key_string[3] + @key_string[4]

    if keys_hash["A"].length == 1
      keys_hash["A"] = "0" + keys_hash["A"]
    end

    keys_hash
  end

end
