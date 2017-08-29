require './lib/braille_library'
require 'pry'

class Decipher
  attr_reader :braille, :text_in
  attr_accessor :text_out

  def initialize(text_in)
    @text_in = text_in
    @text_out = []
    @braille = BrailleLibrary.new
  end

  def inverted_braille
    @braille.braille_conversion.invert
  end

  def braille_to_eng

  end
end
