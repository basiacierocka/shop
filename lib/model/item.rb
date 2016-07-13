module Shop
  class Item
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(product_id:, quantity:)
      @product_id = product_id
      @quantity = quantity
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end
  end
end
