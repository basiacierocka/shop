module Shop
  class FetchBasket
    def call
      BASKET.map do |basket_item|
        {
          product: basket_item.fetch_product,
          quantity: basket_item.quantity,
          total_price: basket_item.total_price
        }
      end
    end
  end
end
