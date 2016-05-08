require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:test_email) { 'test@example.com'}
  let(:user) { User.create(name: "test_name", email: test_email) }

  describe "GET #index" do
    it "redirects to the login page if user is not yet registered" do
      get :index
      expect(response).to redirect_to(sessions_path)
    end

    it "prompts user to login first" do
      get :index
      expect(controller).to set_flash[:notice]
      expect(controller).to set_flash[:notice].to(/Please login first/)
    end

    context "logged in" do
      it "returns http success" do
        session[:current_user_id] = user.id
        get :index
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        session[:current_user_id] = user.id
        get :index
        expect(response).to render_template(:index)
      end

      it "prepares the form entry object" do
        get :index
        expect(assigns :vote).to_not be_nil
      end

      it "prepares candidates list for voting" do
        get :index
        expect(assigns :candidates).to_not be_nil
      end
    end
  end

end
