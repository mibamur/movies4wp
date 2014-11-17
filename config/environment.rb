# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# hack to fix cloudinary error https://github.com/archiloque/rest-client/issues/141
class Hash
  remove_method :read
rescue
end
