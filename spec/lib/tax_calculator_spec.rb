require 'spec_helper'

require_relative '../../lib/tax_calculator'

RSpec.describe TaxCalculator do
  subject(:tax_in_percentage) { described_class.new.get_tax_in_percentage(product_description) }

  describe "#get_tax_in_percentage" do

    context "when the product description is exempt" do
      let(:product_description) { 'a shelf book' }

      context "when it is a book" do
        it "returns 0" do
          expect(tax_in_percentage).to eq(0)
        end
      end

      context "when it is a food" do
        let(:product_description) { 'a delicious chocolate bar' }

        it "returns 0" do
          expect(tax_in_percentage).to eq(0)
        end
      end

      context "when it is a medical product" do
        let(:product_description) { 'headache pills' }

        it "returns 0" do
          expect(tax_in_percentage).to eq(0)
        end
      end

      context "when it is imported" do
        let(:product_description) { 'imported book' }

        it "returns 5%" do
          expect(tax_in_percentage).to eq(0.05)
        end
      end
    end

    context "when the product is not exempted" do
      let(:product_description) { 'a pencil' }

      it "returns 10%" do
        expect(tax_in_percentage).to eq(0.1)
      end

      context "when it is imported" do
        let(:product_description) { 'imported pencil' }

        it "returns 15%" do
          expect(tax_in_percentage).to eq(0.15)
        end
      end
    end
  end
end
