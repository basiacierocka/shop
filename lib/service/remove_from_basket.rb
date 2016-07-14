module Shop
  class RemoveFromBasket
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def Fetch_basket_item
      FetchBasketItem.new.call(basket_item_id)
    end
  end
end
