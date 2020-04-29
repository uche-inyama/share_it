require 'rails_helper'

RSpec.describe "Opinions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/opinions/new"
      expect(response).to have_http_status(:success)
    end
  end

end
