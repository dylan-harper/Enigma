require './lib/enigma'

decr = File.open("decrypted.txt", "w")

ARGV == ["encrypted.txt", decr]
new_file = File.open("encrypted.txt", "r")
new_file_data = File.read("encrypted.txt")
enigma = Enigma.new('message')

key = {
  "A" => "36",
  "B" => "68",
  "C" => "82",
  "D" => "26"
}

offset = {
  "A" => "6",
  "B" => "6",
  "C" => "4",
  "D" => "1"
}

decryption = enigma.decrypt(new_file_data, key, offset)

decr.write(decryption[:decryption])

puts "Created 'decrypted.txt'" #with key #{} and date #{}."
