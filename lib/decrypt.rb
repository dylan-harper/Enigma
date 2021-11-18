require './lib/enigma'

decr = File.open("decrypted.txt", "w")
key = File.open("key.txt", "r")
date = File.open("date.txt", "r")

ARGV == ["encrypted.txt", decr, key, date]

new_file = File.open("encrypted.txt", "r")
new_file_data = File.read("encrypted.txt")
key_data = File.read("key.txt")
date_data = File.read("date.txt")

enigma = Enigma.new

decryption = enigma.decrypt(new_file_data, key_data, date_data)

decr.write(decryption[:decryption])

puts "Created 'decrypted.txt' with key #{key_data} and date #{date_data}."
