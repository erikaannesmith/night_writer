require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'
require 'pry'

class TranslatorTest < MiniTest::Test
  def test_it_exists
    translate = Translator.new("text_in")

    assert_instance_of Translator, translate
  end

  def test_braille_instance
    translate = Translator.new("text_in")
    braille = BrailleLibrary.new

    assert_instance_of BrailleLibrary, translate.braille
  end

  def test_text_out_array
    translate = Translator.new("text_in")
    assert_equal [], translate.text_out
  end

  def test_split_to_string
    translate = Translator.new("hi")

    assert_equal ["h","i"], translate.split_to_array
  end

  def test_translate_to_braille
    translate = Translator.new("hi")
    actual = translate.translate_to_braille
    expected = [["0.", "00", ".."],[".0", "0.", ".."]]

    assert_equal expected, actual
  end

  def test_individual_lines
    translate = Translator.new("hi")

    assert_equal "0..0", translate.line_one
    assert_equal "000.", translate.line_two
    assert_equal "....", translate.line_three
  end

  def test_eighty_character_count
    translate = Translator.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    translate.translate_to_braille
    translate.eighty_character_count

    assert_equal 81, translate.text_out[0].length
  end

  def test_can_output_uppercase
    translate = Translator.new("HI")

    assert_equal [["..0.", "..00", ".0.."], ["...0", "..0.", ".0.."]], translate.translate_to_braille
  end

  def test_translate_mixed_case
    translate = Translator.new("Hi")

    assert_equal [["..0.", "..00", ".0.."], [".0", "0.", ".."]], translate.translate_to_braille
  end

  def test_translate_punctuation
    translate = Translator.new("Hi!")

    assert_equal [["..0.", "..00", ".0.."], [".0", "0.", ".."], ["..", "00", "0."]], translate.translate_to_braille
  end
end
