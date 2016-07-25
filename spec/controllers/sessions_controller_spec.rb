require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let!(:user) { User.create(email: "winktest+interview@winkapp.com", password: "Wink123!")}

  context "with invalid credentials" do
    it "renders new session page with non-existent user" do
      post :create, user: {email: "foo@bar.com", password: "foobar" }
      expect(response).to render_template("new")
    end

    it "renders new session page with wrong password" do
      post :create, user: {email:"winktest+interview@winkapp.com", password: "notapassword"}
      expect(response).to render_template("new")
    end
  end

  context "with valid credentials" do
    it "redirects to user show page" do
      post :create, user: {email: "winktest+interview@winkapp.com", password: "Wink123!"}
      expect(response).to redirect_to(user_url)
    end
  end
end
