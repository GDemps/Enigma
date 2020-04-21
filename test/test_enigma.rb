require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/enigma'
require 'CSV'

class EnigmaTest < Minitest::Test

  def test_instance_of_enigma
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_alphabet
    enigma = Enigma.new
    assert_equal enigma.alphabet, ("a".."z").to_a << " "
  end

  def test_encrypt
    enigma = Enigma.new
    expected = { encryption: "keder ohulw",
                 key: "02715",
                 date: "040895" }
                 enigma.encrypt("hello world", "02715", "040895")
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_without_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    assert_equal encrypted, enigma.encrypt("hello world", "02715", "210420")
  end

  def test_decrypt
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    assert_equal enigma.decrypt(encrypted[:encryption], "02715"),
                { decryption: "hello world", key: "02715", date: "210420" }
  end

end
