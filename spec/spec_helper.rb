ENV["RACK_ENV"] = "test"

RSpec.configure do |config|
  config.disable_monkey_patching!
end
