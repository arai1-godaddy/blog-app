require 'rails_helper'

RSpec.describe User, type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/users"
      expect(response).to have_http_status(:success)
    end
  end

    describe "POST /create" do
        it "returns http success" do
            post "/api/v1/users", params: { user: { name: "John Doe", email: "john doe" } }
            expect(response).to have_http_status(:created)

        end
    end

    describe "GET /show" do
        it "returns http success" do
            user = User.create(name: "John Doe", email: "josn@gmail.com")
            get "/api/v1/users/#{user.id}"
            expect(response).to have_http_status(200)
        end
    end
end