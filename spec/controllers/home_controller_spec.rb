require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:test_email) { 'test@example.com'}
  let(:user) { User.create(name: "test_name", email: test_email) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
