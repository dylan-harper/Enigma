require './lib/random_number'

class Key

  attr_reader :keys#, :num

  def initialize(num)
    @num = num
    @keys = make_keys
  end

  def make_keys
    keys_hash = {}
    # require "pry"; binding.pry

    keys_hash["A"] = @num[0] + @num[1]
    keys_hash["B"] = @num[1] + @num[2]
    keys_hash["C"] = @num[2] + @num[3]
    keys_hash["D"] = @num[3] + @num[4]

    # key_hash = key_hash.transform_values { |value| value.to_i }
    keys_hash
  end


end
