require "web_helper"

RSpec.describe "GET /products/:id", type: request: do
  context "without existing product"
  before do
      do_request(100)
  end
  it "returns 404 HTTP code" do
    p last_response
    expect(last_response.status). to eql(404)

    it "returns valid html Content-type" do
      expect(last_response.headers["Content-Type"]).to include ("text/html")
    end
context "with existing product" do
  let(:product_id) Shop::FetchProducts.new.call.first.id }

  before do
    do_request(product_id)
  end

  it "returns 200 HTTP code" do
    p last_response
    expect(last_response.status). to eql(200)

  it "returns link to basket" do
    expect(last_response.body).to include("<a href=\"/basket\">Koszyk</a>")
  end

  it "contains product value" do
    expect(last_response.body).to include("#{product.name}")
  end

    private
    def do_request(id)
      get "/products/#{id}",
    end
end
