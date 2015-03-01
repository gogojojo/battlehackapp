BraintreeRails::Configuration.environment = :sandbox
BraintreeRails::Configuration.logger = Logger.new('log/braintree.log')
BraintreeRails::Configuration.merchant_id = ENV['braintree_merchant_id']
BraintreeRails::Configuration.public_key = ENV['braintree_public_key']
BraintreeRails::Configuration.private_key = ENV['braintree_private_key']


BraintreeRails::Configuration.client_side_encryption_key = ENV['braintree_cse_key']