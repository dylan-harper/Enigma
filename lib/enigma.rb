require 'date'
require './lib/input'
require './lib/offsets'
require './lib/encryption'
require './lib/decryption'

class Enigma < Input
  include Encryption
  include Decryption

  attr_reader :alphabet

  def initialize
    super(message)
    @alphabet = ("a".."z").to_a << " "
    @encryption = {}

  end

  def encrypt(message, key = @key, offset = @offset)
    applies_keys(message, key, offset)
  end

  def decrypt(ciphertext, key = @key, offset = @offset)
    decodes(ciphertext, key, offset)
  end

end
