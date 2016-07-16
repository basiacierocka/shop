require "web_helper"

RSpec.describe "GET /basket", type: :request do

  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns link to products view" do
    expect(last_response.body).to include("<a href=\"/products\">Produkty</a>")
  end

  it "returns link to homepage" do
    expect(last_response.body).to include("<a href=\"/\">Home</a>")
  end

  private
    def do_request
      get "/basket"
  end
end
