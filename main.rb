require 'pry'

require './lib/product_input_validator'
require './lib/tax_calculator'
require './lib/product_item'
require './lib/cart'

PRODUCT_INPUT_MESSAGE = 'Please, insert the quantity, product description and price.'.freeze
FINISH_MESSAGE = 'Press FINISH to get your receipt.'
ITEM_ADDED_MESSAGE = '[Beep] Item Added!'
INVALID_INPUT_MESSAGE = 'Invalid input'
FINISH_KEY = 'FINISH'.freeze

cart = Cart.new

loop do
  puts PRODUCT_INPUT_MESSAGE
  puts FINISH_MESSAGE

  input = gets.chomp

  break if input == FINISH_KEY

  product_metadata = ProductInputValidator.new(input).read
  if product_metadata
    product_item = ProductItem.new(
      product_metadata[:quantity],
      product_metadata[:description],
      product_metadata[:price]
    )

    product_item.add_sales_taxes
    cart.add!(product_item)

    puts ITEM_ADDED_MESSAGE
  else
    puts INVALID_INPUT_MESSAGE
  end

end

puts cart.receipt.join("\n")
