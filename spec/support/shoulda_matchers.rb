require 'shoulda_matchers'

Shoulda::Matchers.configure, type: :model do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
