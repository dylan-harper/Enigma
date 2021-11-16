require 'date'
require './lib/input'
require './lib/offsets'
require './lib/encryption'

class Enigma < Input
  include Encryption

  attr_reader :alphabet
  # include Output

  def initialize
    super(message)
    @alphabet = ("a".."z").to_a << " "
    @encryption = {}

  end

  def encrypt(message, key = @key, offset = @offset)

  end

  def decrypt(encryption, key, date)

  end

end
