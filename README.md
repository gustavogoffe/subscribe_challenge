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



