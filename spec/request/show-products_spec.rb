require "web_helper"

RSpec.describe "GET /products", type: :request do

  it "returns valid html Content-Type" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "returns h1 element 'Sklep Żeglarski' value" do
    expect(last_response.body).to include ("<h1>Sklep Żeglarski</h1>")
  end

  it "returns link to basket view" do
    expect(last_response.body).to include("<a href=\"/basket\">Koszyk</a>")
  end

  it "returns link to homepage" do
    expect(last_response.body).to include("<a href=\"/\">Produkty</a>")
  end

  context "without existing products"
    before do
      do_request(100)
    end

    it "returns 404 HTTP code" do
      expect(last_response.status).to eql(404)
    end
  end

  context "with existing products" do
    let(:product) { Shop::FetchProducts.new.call.first }

    before do
      do_request(product_id)
    end

    it "returns 200 HTTP code" do
      expect(last_response.status). to eql(200)
    end

    it "contains product name" do
      expect(last_response.body).to include("#{product.name}")
    end

    it "contains product price" do
      expect(last_response.body).to include("#{product.price}")
    end

    it "contains link to product view" do
      expect(last_response.body).to include("<a href=\"/product/:id\"><%= product.name %></a>")
    end

    it "contains submit button" do
      expect(last_response.body).to include("<input type='submit'>")
    end
  end

    private
    def do_request
      get "/",
    end
end
