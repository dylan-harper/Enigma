require './lib/offsets'

module EnigmaHelper

  def make_key_hash(key, key_hash)
    key_hash["A"] = key[0] + key[1]
    key_hash["B"] = key[1] + key[2]
    key_hash["C"] = key[2] + key[3]
    key_hash["D"] = key[3] + key[4]

    if key_hash["A"].length == 1
      key_hash["A"] = "0" + key_hash["A"]
    end

    key_hash
  end

  def make_offset_hash(offset, offset_hash)
    offset_hash["A"] = offset[0]
    offset_hash["B"] = offset[1]
    offset_hash["C"] = offset[2]
    offset_hash["D"] = offset[3]

    offset_hash
  end

  def combine_hashes(key_hash, offset_hash, combined)
    key_hash.each_pair do |key, x|
      offset_hash.each_pair do |offset, y|
        if key == offset
          add = x.to_i + y.to_i
          combined[key] = add.to_s
        end
      end
    end
  end


  def combine_key_offset(key, offset, key_hash, offset_hash, combined)
    make_key_hash(key, key_hash)

    make_offset_hash(offset, offset_hash)

    combine_hashes(key_hash, offset_hash, combined)

    combined
  end

  def move_encrypt(characters_array, combined, holds_letters)
    characters_array.each_with_index do |char, index|
      if !@alphabet.include?(char)
        holds_letters << char
      elsif index == 0 || index % 4 == 0
        move = combined["A"].to_i
      elsif index == 1 || index % 4 == 1
        move = combined["B"].to_i
      elsif index == 2 || index % 4 == 2
        move = combined["C"].to_i
      elsif index == 3 || index % 4 == 3
        move = combined["D"].to_i
      end

      @alphabet.each_with_index do |letter, ind|
        if char == letter
          new_ind = ind + move
          if @alphabet[new_ind] == nil
              while @alphabet[new_ind] == nil do
                new_ind = new_ind - 27
              end
          end
          replace = @alphabet[new_ind]
          holds_letters << replace
        end
      end
    end
  end

  def move_decrypt(characters_array, combined, holds_letters)
    characters_array.each_with_index do |char, index|
      if !@alphabet.include?(char)
        holds_letters << char
      elsif index == 0 || index % 4 == 0
        move = combined["A"].to_i
      elsif index == 1 || index % 4 == 1
        move = combined["B"].to_i
      elsif index == 2 || index % 4 == 2
        move = combined["C"].to_i
      elsif index == 3 || index % 4 == 3
        move = combined["D"].to_i
      end

      @alphabet.each_with_index do |letter, ind|
        if char == letter
          new_ind = ind - move
          if @alphabet[new_ind] == nil
              while @alphabet[new_ind] == nil do
                new_ind = new_ind + 27
              end
          end
          replace = @alphabet[new_ind]
          holds_letters << replace
        end
      end
    end
  end
end
