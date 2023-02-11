PRODUCT_INPUT_MESSAGE = 'Please, insert the quantity, product description and price.'.freeze
FINISH_MESSAGE = 'Press FINISH to get your receipt.'
ITEM_ADDED_MESSAGE = '[Beep] Item Added!'
FINISH_KEY = 'FINISH'.freeze

loop do
  puts PRODUCT_INPUT_MESSAGE
  puts FINISH_MESSAGE

  input = gets.chomp

  break if input == FINISH_KEY

  puts ITEM_ADDED_MESSAGE
end

puts "FINISHED"
