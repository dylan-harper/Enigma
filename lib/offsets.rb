class Offsets

  attr_reader :date, :shifts

  def initialize(date)
    @date = date
    @shifts = make_offsets
  end

  def make_offsets
    date_squared = @date.to_i * @date.to_i
    date_squared_to_string = date_squared.to_s
    reverse_square = date_squared_to_string.reverse

    characters = reverse_square.chars

    offsets_array = []
    characters.each_with_index do |char, index|
      offsets_array << char if index <= 3
    end

    offsets_characters = offsets_array.join
    offsets = offsets_characters.reverse

    offsets
  end

end
