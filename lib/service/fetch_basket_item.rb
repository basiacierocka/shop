module Shop
  class FetchBasketItem
    def call(basket_item)
      return unless basket_item
      BASKET.find do |basket_item|
        basket_item == basket_item.to_i
      end
    end
  end
end
