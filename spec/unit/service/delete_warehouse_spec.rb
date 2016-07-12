require_relative "../../../lib/service/warehouse.rb"
module Shop
  WAREHOUSE = []
end

RSpec.describe Shop::Warehouse do
  subject(:warehouse) {Shop::DeleteWarehouse.new}
  descibe "#call" do
    context "invalid id" do
      it "raises no error if id eq nil" do
        warehouse.call(nil)
      end
    end
    context "valid id" do
      let(:quantity){10}
      let!(:add_to_warehouse) do
        Shop::WAREHOUSE<<Shop::Warehouse.new(1,quantity)
      end
      let!(:first_warehouse) do
      it "reduce quantity" do
        #dane wyjściowe
        expect(first_warehouse.quantity).to eql(10)
        #akcja
        warehouse.call (first_warehouse.id)
        #wynik
        expect(Shop::WAREHOUSE[0].quantity.to eql(quantity-1))
      end
    end
  end
end
