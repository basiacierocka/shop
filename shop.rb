require "bundler/setup"
require "sinatra/base"
Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new(id: "1", name: "kabestan", price: 34, quantity: 30),
    Product.new(id: "2", name: "kotwica", price: 110, quantity: 5),
    Product.new(id: "3", name: "szekla", price: 4.50, quantity: 20),
    Product.new(id: "4", name: "lina_sizalowa_metr", price: 13, quantity: 10),
    Product.new(id: "5", name: "flaga_sygnalowa", price: 10, quantity: 60)
  ]
  BASKET = []
  WAREHOUSE = []

  class App< Sinatra::Base

    get "/" do
      erb :"products/index", locals: { products: PRODUCTS }
    end

    get "/products" do
      @products = FetchProducts.new.call
      erb :"products/show", locals: { products: PRODUCTS }
    end

    get "/products/:id" do |id|
        product = FetchProduct.new.call(id)
        erb :"product/show", locals: { product: product }
    end

    get "/basket" do
      erb :"item/show"
    end

    post "/basket" do
      AddToBasket.new(params).call
      redirect "/products"
    end
  end
end
