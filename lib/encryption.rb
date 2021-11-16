module Encryption

  # def combines_key_offset(k)
  #
  # end

  def applies_keys(message, key, offset)
    combined = {}
    key.each_pair do |key, x|
      offset.each_pair do |offset, y|
        if key == offset
          add = x.to_i + y.to_i
          combined[key] = add.to_s
        end
      end
    end

    message_length = message.length
    characters_array = message.chars

    characters_array.each do |char|


  end

end
