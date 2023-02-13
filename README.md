# +Subscribe Challenge

## My plan to solve this challenge

- Read and break into small steps (15min) (20:49)
- Install ruby, rspec and factory_bot (5min) (8:23)

### Input (30min) (6:44)
- Collect inputs
- Add a key to finish the result

### Product management (1:04:07)
- Generate ProductInput and validate the input
- Insert into the ProductItem

- Calculate the taxes in percentage
  - Create the TaxCalculator
    - add the list of exemptions
    - add the taxes
    - calculate the tax based on the product description

- Operates the sales tax into the Product Item

### Cart management (28:20)
- Add to the cart
  - sum up the total
  - sum up the taxes

- Print the receipt

## PS

- The method to round up to the nearest 0.05 hasn't been working correctly. So, I've spent around 20 minutes to fix it.
- I haven't created the spec for the main.rb file. I had to mock the ``gets.chomp`` method and reproduce every step of
the flow. I could do it, but it will take more time.

## Problem explained

- Basic tax: 10%
  Exemptions: books, food, and medical products
- Import duty: 5%

- Input
  - quantity product description and price

- Round Rule
  - tax * price / 100
    -  rounded to the nearest 0.05

- Output
  - quantity + product description: + price (included taxes)
  - Total taxes
  - Total


## How to run it

- Requires ruby 3.0.2
- Clone the repo
- Run: `ruby main.rb`

## Outputs

### Output 1 - OK

### Output 2 - OK

### Output 3 - NOT OK

I think the correct tax for the fourth item should be `35.45` and NOT `35.55`
because the imported box of chocolates will have a tax of 5%. The total of this
item is 33.75 (11.25 * 3). Aplying 5% of tax will result in `35.43`. Rouding up
to the next 0.05 cents: `35.45`


