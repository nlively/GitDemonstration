if Rails.env == "development"
  # dev settings
  # sandbox password: BoomBoomShab00m
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "s4t6t3gkbzph3wyy"
  Braintree::Configuration.public_key  = "v2yvpr8dd9vpcy2h"
  Braintree::Configuration.private_key = "67e25eb6daec29af3f6973386e8e5a6b"
else
  # production settings
  Braintree::Configuration.environment = :production
  Braintree::Configuration.merchant_id = "bz4mhvh8r8qscmgc"
  Braintree::Configuration.public_key  = "hg2xwf75dp4836pj"
  Braintree::Configuration.private_key = "y9sv4np64pcnkcq6"
end