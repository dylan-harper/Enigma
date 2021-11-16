require './lib/enigma'

enc = File.open("encrypted.txt", "w")

ARGV == ["message.txt", enc]

# message = Input.new("hello world")
file = File.open("message.txt", "r")
message = file.read.chomp
enigma = Enigma.new(message)
encryption = enigma.encrypt(message)

enc.write(encryption)

puts "Encrypted text in message.txt to encrypted.txt"
