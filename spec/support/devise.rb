RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Warden::Test::Helpers
  config.secret_key = '547972dbd81f54167aea4f6c95e4c60870301a14acb544cb0c4e8c8d8e2341e9398d3630927ae17d0b35c32c40c10031aaa89319798c81f6ddf9fbd942d66f74'
end
