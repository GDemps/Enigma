class Enigma

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  # puts "How many shifts?"
  # shift = gets.chomp.to_i

  def encrypt(message, key = 4.times.map { (0..9).to_a.sample }
    .join.rjust(5, "0"), date = Time.now.strftime("%d%m%y"))
    message = message.downcase
    # key = 4.times.map { (0..9).to_a.sample }.join.rjust(5, "0")
    a_key = key[0..1]
    b_key = key[1..2]
    c_key = key[2..3]
    d_key = key[3..4]
    # date = Time.now.strftime("%d%m%y").to_i
    last4 = (date.to_i * date.to_i).to_s[-4..-1]
    a_offset = last4[0]
    b_offset = last4[1]
    c_offset = last4[2]
    d_offset = last4[3]

    shifts = [a = a_key.to_i + a_offset.to_i,
             b = b_key.to_i + b_offset.to_i,
             c = c_key.to_i + c_offset.to_i,
             d = d_key.to_i + d_offset.to_i]

    encrypted_word = []
    num = 0
    shifts.cycle do |shift|
      if encrypted_word.length == message.length
          break
      else
        if @alphabet.include?(message[num]) == false
          encrypted_word << message[num]
          num += 1
        else
          encrypted_hash = Hash[alphabet.zip(alphabet.rotate(shift))]
          encrypted_word << encrypted_hash[message[num]]
          num += 1
        end
      end
    end
    encrypted_word = encrypted_word.join
    { encryption: encrypted_word, key: key, date: date}
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
