class ProductItem
  def initialize(quantity, description, price)
    @quantity = quantity
    @description = description
    @price = price

    @total_price = quantity * price
  end

  def add_sales_taxes(tax_calculator = TaxCalculator.new)
    tax_in_percentage = tax_calculator.get_tax_in_percentage(description)

    @sales_tax = round_up_to_nearest_5_cents((total_price * tax_in_percentage))
    @price_with_taxes = (total_price + sales_tax).round(2)
  end

  def receipt
    "#{@quantity.to_i} #{@description}: #{@price_with_taxes}"
  end

  attr_reader :sales_tax, :price_with_taxes, :description, :price, :total_price

  private

  def round_up_to_nearest_5_cents(number)
    integers = number.to_i
    rounded_decimals = number.modulo(1).round(2)

    first_cent = rounded_decimals.to_s[2].to_i
    last_cent = rounded_decimals.to_s[3].to_i

    unless last_cent.zero?
      if last_cent < 5
        last_cent = 5
      else
        last_cent = 0
        first_cent += 1
      end

    end

    "#{integers}.#{first_cent}#{last_cent}".to_f
  end
end
