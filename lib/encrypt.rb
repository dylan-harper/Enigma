require './lib/enigma'

enc = File.open("encrypted.txt", "w")

ARGV == ["message.txt", enc]
file = File.open("message.txt", "r")
message = file.read.chomp
enigma = Enigma.new
encryption = enigma.encrypt(message)#, '01234', '012345')


key_file = File.open("key.txt", "w")
date_file = File.open("date.txt", "w")

key_file.write(encryption[:key])
date_file.write(encryption[:date])
enc.write(encryption[:encryption])

puts "Created 'encrypted.txt' with key #{encryption[:key]} and date #{encryption[:date]}."
