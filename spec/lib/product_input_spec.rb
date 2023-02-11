require 'spec_helper'

require_relative '../../lib/product_input_validator'

RSpec.describe ProductInput do
  subject(:product_validator) { described_class.new(input) }

  describe "#read" do
    context "when it has a valid input format" do
      let(:input) { "2 book at 2.53" }
      it "returns a hash with quantity, product description and price" do
        expect(product_validator.read).to eq({ 
          quantity: 2.0, description: "book", price: 2.53
        })
      end
    end

    context "when it has a bad input" do
      context "when it misses the quantity" do
        let(:input) { "book at 2.53" }

        it "returns nil" do
          expect(product_validator.read).to be_nil
        end
      end

      context "when it misses the product description" do
        let(:input) { "2 at 2.53" }

        it "returns nil" do
          expect(product_validator.read).to be_nil
        end
      end

      context "when it misses the price" do
        let(:input) { "2 book" }

        it "returns nil" do
          expect(product_validator.read).to be_nil
        end
      end

    end
  end
end
