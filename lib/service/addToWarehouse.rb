module Shop
  class AddToWarehouse
    def call(product_id, quantity)
      WAREHOUSE << Item.new(product_id, quantity)
    end
  end
end
