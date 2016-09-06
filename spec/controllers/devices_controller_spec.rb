require 'rails_helper'

RSpec.describe DevicesController, :type => :controller do
  let(:wink_user) { User.create!(email: 'winktest+interview@winkapp.com', password: 'Wink123!') }



  describe "GET #index" do
    context "when logged out" do

      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to sign in page" do
        get :index
        expect(response).to redirect_to(new_session_url)
      end
    end
  end
end
