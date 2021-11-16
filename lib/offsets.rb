class Offsets

  attr_reader :date, :offsets

  def initialize(date)
    @date = date
    @offsets = make_offsets

  end

  def make_offsets
    date_squared = @date.to_i * @date.to_i
    date_squared_to_string = date_squared.to_s
    reverse_square = date_squared_to_string.reverse()

    offsets_hash = {}
    offsets_hash["A"] = reverse_square[3]
    offsets_hash["B"] = reverse_square[2]
    offsets_hash["C"] = reverse_square[1]
    offsets_hash["D"] = reverse_square[0]

    offsets_hash
  end
end
