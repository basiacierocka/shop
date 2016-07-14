require "web_helper"

RSpec.describe "GET /", type: :request do
  before do
      do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status). to eql(200)

  it "returns valid html Content-type" do
    expect(last_response.headers["Content-Type"]).to include ("text/html")
  end

  it "returns h1 element 'Sklep Żeglarski' value" do
    expect(last_response.body).to include ("<h1>Sklep Żeglarski</h1>")
  end

  it "returns link to basket view" do
    expect(last_response.body).to include("<a href=\"/basket\">Koszyk</a>")
  end

  it "returns link to products view" do
    expect(last_response.body).to include("<a href=\"/products\">Produkty</a>")
  end

  private
    def do_request
      get "/",
    end
end
