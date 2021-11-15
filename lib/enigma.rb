require 'date'
require './lib/input'

class Enigma < Input
  # include Output

  def initialize
    super(message)

  end

  def encrypt(message, key = @key, date = @date)

  end

  def decrypt(encryption, key, date)

  end

end
