require_relative "../../../lib/service/warehouse.rb"

RSpec.describe Shop::Warehouse do
  it "has 4 params" do
    expect{ Product.new(nil, nil, nil,nil)}.to_not raise_error
  end
end
