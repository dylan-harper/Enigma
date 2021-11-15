class Offsets

  attr_reader :date

  def initialize(date)
    @date = date
    @offsets = make_offsets

  end

  def make_offsets
    date_squared = @date.to_i * @date.to_i
    date_sqaured_to_string = date_squared.to_s

    offsets_hash = {}
    offsets_hash["A"] = date_sqaured_to_string[]
  end
end
