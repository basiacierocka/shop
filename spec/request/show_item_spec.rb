require "web_helper"

RSpec.describe "GET /basket", type: :request do

  let(:first_item) {Shop::FetchBasket.new.call.first}
  let(:last_item) {Shop::FetchBasket.new.call.last}

  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "contains first basket item name in h1 element" do
    expect(last_response.body).to include("#{first_item.name}")
  end

  it "contains last basket item name in h1 element" do
    expect(last_response.body).to include("#{last_item.name}")
  end

  it "returns link to products view" do
    expect(last_response.body).to include("<a href=\"/products\">Produkty</a>")
  end

  it "returns link to homepage" do
    expect(last_response.body).to include("<a href=\"/\">Home</a>")
  end

  it "returns input type 'submit' element" do
    expect(last_response.body).to include("<input type=\"submit\" value=\"Usuń\">")
  end

  private
    def do_request
      get "/basket"
  end
end
