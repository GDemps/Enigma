require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/enigma'
require 'CSV'

class EnigmaTest < Minitest::Test

  def test_instance_of_enigma
    enigma1 = Enigma.new
    assert_instance_of Enigma, enigma1
  end

  def test_alphabet
    enigma1 = Enigma.new
    assert_equal enigma1.alphabet, ("a".."z").to_a << " "
  end

  def test_encrypt
    enigma1 = Enigma.new
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }
                 enigma1.encrypt("hello world", "02715", "040895")
    assert_equal expected, enigma1.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_without_date
    enigma1 = Enigma.new
    encrypted = enigma1.encrypt("hello world", "02715")
    assert_equal encrypted, enigma1.encrypt("hello world", "02715", "190420")
  end

  def test_decrypt
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    assert_equal enigma.decrypt(encrypted[:encryption], "02715"),
                { decryption: "hello world", key: "02715", date: "190420" }
  end

end
