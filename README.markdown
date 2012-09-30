## Running locally

1. cd living-social
2. rake db:create:all
3. rake db:migrate
4. rails server

## Uploading a file

1. Open up a web browser and navigate to 'http://localhost:3000/acquisition/new'
2. It will prompt for a file that contains the acquisition information

## Testing

1. rake db:test:load
2. rake db:test:prepare
3. rake test

###Single test

1. ruby -Itest test/unit/order_test.rb
2. ruby -Itest test/unit/item_test.rb
3. ruby -Itest test/unit/merchant_test.rb
4. ruby -Itest test/functional/acquisition_controller_test.rb

## Note

Built using ruby 1.8.7 and Rails 3.0.5
