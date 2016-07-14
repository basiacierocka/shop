require "web_helper"

RSpec.describe "POST /basket", type: :request do
  context "invalid params" do
    let(:invalid params){ {foo:"bar"} }

    before do
      do_request(invalid_params)
    end

    it "return 422 HTTP status code" do
      expect(last_response.status). to eql(422)
    end
  end

  context "valid params" do
    let(:params){ {product_id:1, quantity:10} }
    let(:domain){ {"http://example.org"} }

    before do
      do_request(params)
    end

    it "redirect to products view" do
      expect(last_response).to be_redirect
    end

    it "return 201 HTTP status code" do
      expect(last_response.status). to eql(200)
    end
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include ("text/html")
  end

  it "returns link to products view" do
    expect(last_response.body).to include("<a href=\"/products\">Produkty</a>")
  end

  it "returns link to homepage" do
    expect(last_response.body).to include("<a href=\"/\">Home</a>")
  end

  private
    def do_request(params={})
      post "/basket", params
    end
end
