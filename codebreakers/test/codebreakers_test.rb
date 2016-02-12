require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/codebreakers'

class CodeBreakersTest < Minitest::Test
  attr_reader :cipher

  def setup
    @cipher = CodeBreakers.new
  end

  def test_if_codebreakers_exists
    assert cipher
  end

  def test_initials_for_given_name
    # cover edge cases
    assert_equal "TS", cipher.initials("Taylor Swift")
  end

  def test_ceasar_cipher_works_with_one_char
    assert_equal "b", cipher.caeser_cipher(1, "a")
  end

  def test_ceasar_cipher_works_with_char_and_space
    assert_equal "b b", cipher.caeser_cipher(1, "a a")
  end

  def test_ceasar_cipher_works_with_char_greater_than_z
    assert_equal "b", cipher.caeser_cipher(2, "z")
  end

  def test_ceasar_cipher_works_with_char_greater_than_capital_Z
    assert_equal "B", cipher.caeser_cipher(2, "Z")
  end

  def test_ceasar_cipher_works_with_upper_and_lower_case_letters
    assert_equal "Or fher gb qevax lbhe Binygvar!", cipher.caeser_cipher(13, "Be sure to drink your Ovaltine!")
  end

  def test_the_worst_works_with_upper_and_lower_case_letters
    assert_equal "Gbjq EZJ hqqpl uhzuc.", cipher.the_worst("taylor", "Make PHP great again.")
  end

end
