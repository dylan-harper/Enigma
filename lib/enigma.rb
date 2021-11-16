require 'date'
require './lib/input'
require './lib/offsets'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma_helper'

class Enigma < Input
  include Encryption
  include Decryption
  # include EnigmaHelper

  attr_reader :alphabet

  def initialize(message)
    super(message)
    @alphabet = ("a".."z").to_a << " "
    @encryption = {}
    @decryption = {}

  end

  def encrypt(message, key = @key, offset = @offset)
    applies_keys(message, key, offset)
  end

  def decrypt(ciphertext, key = @key, offset = @offset)
    decodes(ciphertext, key, offset)
  end

end
