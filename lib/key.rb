
class Key

  attr_reader :keys, :key_string, :random_number

  def initialize(random_number)
    @random_number = random_number.rand_num
    @keys = make_keys
    # @key_string = modify_keys
  end

  def make_keys
    keys_hash = {}

    keys_hash["A"] = @random_number[0] + @random_number[1]
    keys_hash["B"] = @random_number[1] + @random_number[2]
    keys_hash["C"] = @random_number[2] + @random_number[3]
    keys_hash["D"] = @random_number[3] + @random_number[4]

    keys_hash
  end

  # def modify_keys
  #   key_string = ""
  #   @keys.each_pair do |k, v|
  #     key_string = key_string + v
  #   end
  #   key_chars = key_string.chars
  #   require "pry"; binding.pry
  #
  #   key_chars.delete_at(1)
  #   key_chars.delete_at(3)
  #   key_chars.delete_at(5)
  #   key_chars = key_chars.join
  # end


end
