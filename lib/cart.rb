class Cart
  attr_reader :products_items, :total_price, :sales_tax

  def initialize
    @products_items = []
    @total_price = 0
    @sales_tax = 0
  end

  def add!(product_item)
    @total_price += product_item.price_with_taxes
    @sales_tax += product_item.sales_tax

    @products_items << product_item
  end

  def receipt
    [
      @products_items.map(&:receipt),
      "Sales Taxes: #{@sales_tax}",
      "Total: #{@total_price}"
    ].flatten
  end
end
