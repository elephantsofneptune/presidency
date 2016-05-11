require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "redirects to root if already logged in" do
      user = User.create!(name: "test_name", email: "test_email@nextacademy.com")
      session[:current_user_id] = user.id
      get :show
      expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    context "valid login" do
      before do
        post :create, :user => { id: 1, name: "test_name", email: "test_email@nextacademy.com" }
      end

      it "creates user session" do
        expect(controller).to set_session[:current_user_id]
        expect(session[:current_user_id]).to eq assigns[:user].id
      end

      it "redirects to the root path if user is created" do
        expect(response).to redirect_to(root_path)
      end

      it "welcomes user" do
        expect(controller).to set_flash[:notice]
        expect(flash[:notice]).to eq "Welcome to the Presidential Voting System, test_name!"
      end
    end

    context "invalid login without email" do
      before do
        post :create, :user => { name: "test_name" }
      end
      it "redirects back to the logins path if user did not get created" do
        expect(response).to redirect_to(sessions_path)
      end

      it "shows email error message" do
        expect(controller).to set_flash[:notice]
        expect(flash[:notice]).to eq "Email can't be blank, Email is invalid"
      end
    end

    context "invalid login without name" do
      before do
        post :create, :user => { email: "weijia@kfit.com" }
      end
      it "redirects back to the logins path if user did not get created" do
        expect(response).to redirect_to(sessions_path)
      end

      it "shows name error message" do
        expect(controller).to set_flash[:notice]
        expect(flash[:notice]).to eq "Name can't be blank"
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      post :create, :user => { name: "test_name", email: "test_email@nextacademy.com" }
      delete :destroy
    end

    it "sets session to nil when user logs out" do
      expect(session[:current_user_id]).to eq nil
    end

    it "redirects back to to sessions path if user logs out" do
        expect(response).to redirect_to(sessions_path)
      end

    it "shows logged out message" do
      expect(flash[:notice]).to eq "You have successfully logged out."
    end
  end

end
