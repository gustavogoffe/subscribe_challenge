class ProductInput
  AT_REGEX = /\sat\s/
  ONLY_DIGITS_REGEX = /(\d+)/

  def initialize(input)
    @input = input
  end

  # A valid input should contain 4 elements:
  
  # quantity at the beginning
  # description at the middle
  # at word
  # price at the end
  # Ex of a valid input:
  #   - 1 book at 12.49
  def read
    quantity_and_description, price = input.split(AT_REGEX)
    quantity, description = quantity_and_description.split(ONLY_DIGITS_REGEX).reject(&:blank?)

    quantity = quantity.to_f
    description = description&.lstrip || ''
    price = price.to_f

    return nil if quantity.zero? || description.empty? || price.zero?

    { quantity: quantity, description: description, price: price }
  end

  private

  attr_reader :input
end
