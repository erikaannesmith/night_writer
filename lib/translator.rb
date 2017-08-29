require './lib/braille_library'
require 'pry'

class Translator
  attr_reader :braille, :text_in
  attr_accessor :text_out

  def initialize(text_in)
    @braille = BrailleLibrary.new
    @text_in = text_in
    @text_out = []
  end

  def split_to_array
    text_in.chars
  end

  def translate_to_braille
    split_to_array.map do |letter|
      @braille.braille_conversion[letter]
    end
  end

  def line_one
    translate_to_braille.reduce("") do |result, braille_letter|
      result << braille_letter[0]
    end
  end

  def line_two
    translate_to_braille.reduce("") do |result, braille_letter|
      result << braille_letter[1]
    end
  end

  def line_three
    translate_to_braille.reduce("") do |result, braille_letter|
      result << braille_letter[2]
    end
  end

  def eighty_character_count
    one = line_one
    two = line_two
    three = line_three
    until one.length == 0
      @text_out << one.slice!(0..79) + "\n"
      @text_out << two.slice!(0..79) + "\n"
      @text_out << three.slice!(0..79) + "\n"
    end
    @text_out.join
  end
end
