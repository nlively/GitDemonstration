if Rails.env == "development"
  # dev settings
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "vw8yzrwxknfh9tjc"
  Braintree::Configuration.public_key  = "9swk7k353dbq8q2p"
  Braintree::Configuration.private_key = "9cmr3vrxfmpndgh7"
else
  # production settings
  Braintree::Configuration.environment = :production
  Braintree::Configuration.merchant_id = "bz4mhvh8r8qscmgc"
  Braintree::Configuration.public_key  = "9js4yjx87y7xpp9t"
  Braintree::Configuration.private_key = "jtbw9r3yg3yx6ytq"
end