require 'spec_helper'

require_relative '../../lib/cart'
require_relative '../../lib/product_item'
require_relative '../../lib/tax_calculator'

RSpec.describe Cart do

  subject(:cart) { described_class.new }
  let(:product_item) { ProductItem.new(2, "pencil", 5) }

  before { product_item.add_sales_taxes }

  describe "#add!" do
    it "adds the product item to the cart and updates total_price and sales_tax fields" do
      expect(cart.products_items).to be_empty
      expect(cart.total_price).to be_zero
      expect(cart.sales_tax).to be_zero

      cart.add!(product_item)

      expect(cart.products_items).not_to be_empty
      expect(cart.total_price).to eq(10)
      expect(cart.sales_tax).to eq(1)
    end
  end

  describe "#receipt" do
    it "returns an array containing each item with sales taxes and the total fields" do
      expect(cart.receipt).to eq([
        "Sales Taxes: 0",
        "Total: 0"
      ])

      cart.add!(product_item)

      expect(cart.receipt).to eq([
        product_item.receipt,
        "Sales Taxes: 1.0",
        "Total: 10"
      ])
    end
  end
end
