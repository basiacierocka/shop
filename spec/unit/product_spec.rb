require_relative "../../lib/product.rb"

RSpec.describe Product do
  it "has 4 params" do
    expect{ Product.new(nil)}.to eql(nil)
  end
end
