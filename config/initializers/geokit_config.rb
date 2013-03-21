#Geokit.configure do |config|
#  config.geokit.default_units = :miles
#  config.geokit.default_formula = :sphere
#  config.geokit.geocoders.google = ''
#  config.geokit.geocoders.provider_order = [:google]
#end


if defined? Geokit

	# These defaults are used in Geokit::Mappable.distance_to and in acts_as_mappable
	Geokit::default_units = :miles
	Geokit::default_formula = :sphere

	# This is the timeout value in seconds to be used for calls to the geocoder web
	# services.  For no timeout at all, comment out the setting.  The timeout unit
	# is in seconds.
#	Geokit::Geocoders::timeout = 3

	# This is your Google Maps geocoder key.
  Geokit::Geocoders::google = 'AIzaSyB4CXWgUoLWqaS1WRUGJz9_LMvYCZp7VEw'


	# This is the order in which the geocoders are called in a failover scenario
	# If you only want to use a single geocoder, put a single symbol in the array.
	# Valid symbols are :google, :yahoo, :us, and :ca.
	# Be aware that there are Terms of Use restrictions on how you can use the
	# various geocoders.  Make sure you read up on relevant Terms of Use for each
	# geocoder you are going to use.
	Geokit::Geocoders::provider_order = [:google,:us]
end