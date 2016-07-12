require_relative "../../lib/shop.rb"

RSpec.describe Shop do
  describe "#start_shopping" do
  let(:user_input) { "t" }

  it "get user input" do
    expect user_input != "x"
  end
  it "welcome with word 'Witam'"do
    expect(welcome_text).to start_with ("Witam")
  end
  it "is warehouse instance of class Warehouse" do
      expect(Warehouse.new).to be_instance_of(Warehouse)
end
 end
end
