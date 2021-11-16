require './lib/input'
require './lib/enigma'



ARGV == ["message.txt", File.open("encrypted.txt", "w")]

encrypted

puts "Encrypted text in message.txt"
