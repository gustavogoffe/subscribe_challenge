# +Subscribe Challenge

## My plan to solve this challenge

### First steps

- Read and break into small steps (15min) (20min)
- Install ruby, rspec and factory_bot (5min) (8min)

### Input (30min) (7min)
- Collect inputs
- Add a key to finish the result

### Product management (1h04min)
- Generate ProductInput and validate the input
- Insert into the ProductItem

- Calculate the taxes in percentage
  - Create the TaxCalculator
    - add the list of exemptions
    - add the taxes
    - calculate the tax based on the product description

- Operates the sales tax into the Product Item

### Cart management (28min)
- Add to the cart
  - sum up the total
  - sum up the taxes

- Print the receipt

### Fixing the round up method (20min)

## TOTAL: 2 hours and 27 minutes.

## PS

- The method to round up to the nearest 0.05 hasn't been working correctly. So, I've spent around 20 minutes to fix it.
- I haven't created the spec for the main.rb file. I had to mock the ``gets.chomp`` method and reproduce every step of
the flow. I could do it, but it will take more time.

## Logic to calculate taxes

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

- Requires `ruby 3.0.2`
- Clone the repo
- Run: `ruby main.rb`

**In order to finish the inputs and get the final receipt, you should type FINISH**

## Outputs

### Output 1 - OK

<img width="432" alt="Screenshot 2023-02-13 at 19 09 11" src="https://user-images.githubusercontent.com/54562538/218592589-ef505d98-399d-441c-8684-83018cae3fa6.png">


### Output 2 - OK

<img width="426" alt="Screenshot 2023-02-13 at 19 45 29" src="https://user-images.githubusercontent.com/54562538/218592615-46a4630d-a965-4202-8d91-fccf13f4b674.png">


### Output 3 - NOT OK

<img width="432" alt="Screenshot 2023-02-13 at 19 09 11" src="https://user-images.githubusercontent.com/54562538/218592638-49c5eab2-50cd-40e7-93d7-93f77a47216f.png">

I think the correct tax for the fourth item should be `35.45` and NOT `35.55`
because the imported box of chocolates will have a tax of 5%. The total of this
item is 33.75 (11.25 * 3). Aplying 5% of tax will result in `35.43`. Rouding up
to the next 0.05 cents: `35.45`


