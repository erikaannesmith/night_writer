require 'minitest/autorun'
require 'minitest/pride'
require './lib/decipher'
require 'pry'

class DecipherTest < MiniTest::Test
  def test_it_exists
    decipher = Decipher.new("text_in")

    assert_instance_of Decipher, decipher
  end

  def test_key_value_braille_can_invert
    skip
    decipher = Decipher.new("text_in")

    assert_equal , decipher.inverted_braille
  end
end
