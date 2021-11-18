require './lib/input'
require './lib/enigma_helper'

class Enigma < Input
  include EnigmaHelper

  attr_reader :alphabet, :encryption, :decryption

  def initialize
    super()
    @encryption = {}
    @decryption = {}
  end

  def encrypt(message, key = @key, date = @date)

    message = message.downcase

    offset_instance = Offsets.new(date)
    offset = offset_instance.shifts

    key_hash = {}
    offset_hash = {}
    combined = {}

    combine_key_offset(key, offset, key_hash, offset_hash, combined)

    characters_array = message.chars
    holds_letters = []

    move_encrypt(characters_array, combined, holds_letters)

    encrypted_message = holds_letters.join("")

    @encryption = {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(ciphertext, key = @key, date = @date)

    ciphertext = ciphertext.downcase

    offset_instance = Offsets.new(date)
    offset = offset_instance.shifts

    key_hash = {}
    offset_hash = {}
    combined = {}

    combine_key_offset(key, offset, key_hash, offset_hash, combined)

    characters_array = ciphertext.chars
    holds_letters = []

    move_decrypt(characters_array, combined, holds_letters)

    decrypted_message = holds_letters.join("")

    @decryption = {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end

end
