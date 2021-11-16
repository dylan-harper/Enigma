require './lib/enigma'


enc = File.open("encrypted.txt", "w")

ARGV == ["message.txt", enc]
file = File.open("message.txt", "r")
message = file.read.chomp
enigma = Enigma.new(message)
encryption = enigma.encrypt(message)

enc.write(encryption[:encryption])

puts "Created 'encrypted.txt' with key #{encryption[:key]} and date #{encryption[:date]}."
