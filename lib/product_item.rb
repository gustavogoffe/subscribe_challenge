class ProductItem
  def initialize(quantity, description, price)
    @quantity = quantity
    @description = description
    @price = price

    @total_price = quantity * price
  end

  def add_sales_taxes(tax_calculator = TaxCalculator.new)
    tax_in_percentage = tax_calculator.get_tax_in_percentage(description)

    @sales_tax = total_price * tax_in_percentage
    @price_with_taxes = total_price + sales_tax
  end

  attr_reader :sales_tax, :price_with_taxes, :description, :price, :total_price
end
