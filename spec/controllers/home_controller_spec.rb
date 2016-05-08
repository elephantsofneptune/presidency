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
  end

end
