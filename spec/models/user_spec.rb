require 'rails_helper'

RSpec.describe "User", :type => :model do
  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(email: "example@example.com", password: "password")
      user = User.find_by_email("example@example.com")
      expect(user.password).not_to be("password")
    end

    it "uses BCrypt to encrypt password" do
      expect(BCrypt::Password).to receive(:create)
      User.new(email: "example@example.com", password: "password")
    end
  end
end
