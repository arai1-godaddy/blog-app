require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:user) { User.new(name: "John Doe", email: "john@example.com") }
  subject {Post.new(title: "Hello", content: "Hello World", user: user)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
