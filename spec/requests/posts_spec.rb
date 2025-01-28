require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { User.create!(id: 1, name: "Test User", email: "test@example.com") }
  let!(:post1) { Post.create!(title: "First Post", content: "This is the first post content", user_id: user.id) }
  let!(:post2) { Post.create!(title: "Second Post", content: "This is the second post content", user_id: user.id) }

  describe "GET /posts" do
    it "returns all posts with status 200" do
      get "/api/v1/posts"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /posts/:id" do
    it "returns the specific post with status 200" do
      get "/api/v1/posts/#{post1.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["title"]).to eq(post1.title)
    end
  end

  describe "POST /posts" do
    it "creates a new post and returns it with status 200" do
      post_params = { post: { title: "New Post", content: "New post content", user_id: user.id } }
      post "/api/v1/posts", params: post_params

      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["title"]).to eq("New Post")
      expect(parsed_response["content"]).to eq("New post content")
    end

    it "returns an error when creation fails" do
      post_params = { post: { title: "", content: "Invalid post content", user_id: user.id } }
      post "/api/v1/posts", params: post_params

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["error"]).to eq("Error creating post")
    end
  end
end