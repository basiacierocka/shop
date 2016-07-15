require "web_helper"

RSpec.describe "GET /products", type: :request do

  let(:first_product) {Shop::FetchProducts.new.call.first}
  let(:last_product) {Shop::FetchProducts.new.call.last}

  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "contains first product name in h1 element" do
    expect(last_response.body).to include("#{first_product.name}")
  end

  it "contains last product name in h1 element" do
    expect(last_response.body).to include("#{last_product.name}")
  end

  it "returns link to basket view" do
    expect(last_response.body).to include("<a href=\"/basket\">Koszyk</a>")
  end

  it "returns link to homepage" do
    expect(last_response.body).to include("<a href=\"/\">Home</a>")
  end

  it "returns input type 'submit' element" do
    expect(last_response.body).to include("<input type=\"submit\" value=\"Dodaj do koszyka\">")
  end

  private
    def do_request
      get "/products"
  end
end
