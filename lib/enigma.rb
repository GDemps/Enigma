class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  # puts "How many shifts?"
  # shift = gets.chomp.to_i

  def encrypt(message, key, date)
    message = "hello world"
    key = 4.times.map { (0..9).to_a.sample }.join.rjust(5, "0")
    a_key = key[0..1]
    b_key = key[1..2]
    c_key = key[2..3]
    d_key = key[3..4]
    date = Time.now.strftime("%d%m%y").to_i
    last4 = (date * date).to_s[-4..-1]
    a_offset = last4[0]
    b_offset = last4[1]
    c_offset = last4[2]
    d_offset = last4[3]

    require "pry"
    binding.pry
  end

end

# puts "How many shifts?"
# shift = gets.chomp.to_i
#
# puts "What word would you like to encrypt?"
# string = gets.chomp.downcase
#
#
# def caesar_cipher(string, shift)
#   alphabet = Array('a'..'z')
#   encrypter = Hash[alphabet.zip(alphabet.rotate(shift))]
#   string.chars.map { |c| encrypter.fetch(c, " ") }
# end
#
# puts caesar_cipher("#{string}", shift).join
