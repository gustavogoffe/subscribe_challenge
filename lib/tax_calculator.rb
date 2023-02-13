class TaxCalculator
  DEFAULT_TAX_IN_PERCENTAGE = 0.1 #10%
  IMPORTED_TAX_IN_PERCENTAGE = 0.05 #5%

  IMPORTED_KEYWORD = 'imported'.freeze

  EXEMPTIONS = {
    "books" => ['book'],
    "food" => ['chocolate', 'chocolates'],
    "medical products" => ['headache pills'],
  }

  def get_tax_in_percentage(product_description)
    tax = 0
    is_product_exempt = EXEMPTIONS.values.flatten.any? do |exemption|
      product_description.include?(exemption)
    end

    tax += DEFAULT_TAX_IN_PERCENTAGE unless is_product_exempt
    tax += IMPORTED_TAX_IN_PERCENTAGE if product_description.include?(IMPORTED_KEYWORD)

    tax.round(2)
  end

end
