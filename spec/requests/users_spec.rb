require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /showroom" do
    it "returns http success" do
      get "/users/showroom"
      expect(response).to have_http_status(:success)
    end
  end

end
