require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "POST #create" do
    context "with invalid params" do
      it "validates presence of username and password" do
        post :create, user: { email: "example@example.com", password: "" }
        expect(response).to redirect_to(new_user_url)
      end
    end

    context "with valid params" do
      it "redirects to devices index on success" do
         post :create, user: { email: "winktest+interview@winkapp.com", password: "Wink123!" }
         expect(response).to redirect_to(user_url)
      end
    end
  end
end
