require "bundler/setup"
require "sinatra/base"
Dir["./lib/**/*.rb"].each{|file| require file}

module Shop
  PRODUCTS = [
    Product.new(name: "kabestan", price: 34),
    Product.new(name: "kotwica", price: 110),
    Product.new(name: "szekla", price: 4.50),
    Product.new(name: "lina_sizalowa_metr", price: 13),
    Product.new(name: "flaga_sygnalowa", price: 10)
  ]
  BASKET = []
  WAREHOUSE = []

  class App < Sinatra::Base

    configure do
      set :dump_errors, false
      set :method_override, true
    end

    get "/" do
      erb :"products/index", locals: { products: PRODUCTS }
    end

    get "/products" do
      @products = FetchProducts.new.call
      erb :"products/show", locals: { products: PRODUCTS }
    end

    get "/products/:id" do |id|
        product = FetchProduct.new.call(id)
        halt 404 unless product
        erb :"product/show", locals: { product: product }
    end

    get "/basket" do
      basket = FetchBasket.new.call
      erb :"item/show", locals: { basket: basket }
    end

    post "/basket" do
      begin
        AddToBasket.new(params).call
        redirect "/products"
      rescue KeyError
        halt 422
      end
    end
  end
end
