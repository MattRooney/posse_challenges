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

  def test_ceasar_cipher_works_with_upper_and_lower_case_letters
    assert_equal "Or fher gb qevax lbhe Binygvar!", cipher.caeser_cipher(13, "Be sure to drink your Ovaltine!")
  end

  def test_the_worst_works_with_upper_and_lower_case_letters
    assert_equal "Faip DYI gppok tgytb.", cipher.the_worst("taylor", "Make PHP great again.")
  end

end
