require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "redirects to root if already logged in" do

    end
  end

  context "valid login" do
    before do
      post :create, :user => { id: 1, name: "test_name", email: "test_email@nextacademy.com" }
    end

    it "creates user session" do
      expect(controller).to set_session[:current_user_id]
      expect(session[:current_user_id]).to eq assigns[:user].id
    end

    it "redirects to the root path if a user got created" do
      expect(response).to redirect_to(root_path)
    end

    it "welcomes user" do
      expect(controller).to set_flash[:notice]
      expect(flash[:notice]).to eq "Welcome to the Presidential Voting System, test_name!"
    end
  end

  context "unsuccessful login" do
    before do
      post :create, :user => { name: "test_name" }
    end
    it "redirects back to the logins path if a user did not get created" do
      expect(response).to redirect_to(sessions_path)
    end

    it "shows error message" do
      expect(controller).to set_flash[:notice]
      expect(flash[:notice]).to eq "Login details was incomplete."
    end
  end

  context 'DELETE #destroy' do
    setup { delete :destroy }

    it "sets session to nil when logs out" do
      expect(controller).to_not set_session
      expect(session[:current_user_id]).to eq nil
    end

    xit "shows logged out message" do
      expect(flash[:notice]).to eq "You have successfully logged out."
    end
  end

end
