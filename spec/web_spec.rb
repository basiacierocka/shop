require "spec_helper"
require"rack/test"

module AppHelper
  def app
    Shop::App
    end
  end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
end
