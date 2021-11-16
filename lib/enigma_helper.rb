module EnigmaHelper

  def combine_key_offset(key, offset)
    combined = {}
    key.each_pair do |key, x|
      offset.each_pair do |offset, y|
        if key == offset
          add = x.to_i + y.to_i
          combined[key] = add.to_s
        end
      end
    end
    combined
  end
end
