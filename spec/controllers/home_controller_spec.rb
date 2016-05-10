require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:test_email) { 'test@example.com'}
  let(:user) { User.create(name: "test_name", email: test_email) }

  describe "GET #index" do
    it "redirects to the login page if user is not yet registered or logged in" do
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

      it "prepares the form vote object" do
        get :index
        expect(assigns :vote).to be_a_new(Vote)
      end

      it "assigns @candidates" do
        candidate = Candidate.create!(name: "Donald Tramp", party: "Repooplican", image_url: "https://placehold.it/300.png/09f/fff")
        get :index
        expect(assigns :candidates).to_not be_nil
        expect(assigns :candidates).to eq([candidate])
      end
    end
  end

end
