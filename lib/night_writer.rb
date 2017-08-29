require './lib/translator'

file_in = ARGV[0]
file_out = ARGV[1]

input_data = File.read(file_in).chomp

translator = Translator.new(input_data)

output = File.open(file_out, 'w+')
output.write(translator.eighty_character_count)

puts "Created #{ARGV[1]} containing #{translator.text_in.length} characters."
