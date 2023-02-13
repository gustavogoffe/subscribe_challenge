require 'spec_helper'

require_relative '../../lib/product_item'
require_relative '../../lib/tax_calculator'

RSpec.describe ProductItem do
  let(:product_item) { described_class.new(2, "pencil", 5) }

  describe "#total_price" do
    it "calculates correctly when instanciated" do
      expect(product_item.total_price).to eq(10)
    end
  end

  describe "#add_sales_taxes" do
    it "fills out the sales_tax and price_with_taxes fields" do
      expect(product_item.sales_tax).to be_nil
      expect(product_item.price_with_taxes).to be_nil

      product_item.add_sales_taxes

      # Considering a default tax of 10% from TaxCalculator
      expect(product_item.sales_tax).to eq(1)
      expect(product_item.price_with_taxes).to eq(11)
    end

    it "roundes up to the nearest 0.5" do
      product_item = described_class.new(1, "imported bottle of perfume", 47.5)

      product_item.add_sales_taxes

      expect(product_item.sales_tax).to eq(7.15)
    end
  end

  describe "#receipt" do
    before { product_item.add_sales_taxes }

    it "returns the receipt" do
      expect(product_item.receipt).to eq("2 pencil: 11.0")
    end
  end
end
