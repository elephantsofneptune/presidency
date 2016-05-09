require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  let(:test_email) { 'test@example.com'}
  let(:user) { User.create(name: "test_name", email: test_email) }
  let(:candidate) { Candidate.create(name: "Donald Tramp", party: "Repooplican", image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }

  describe "POST #create" do
    context "successfully created vote" do
      let(:current_user) { user }
      before do
        session[:current_user_id] = user.id
        post :create, :vote => {
          candidate: candidate, user: current_user
        }
      end
      it "valid creation will increase vote count" do
        expect(Vote.count).to eq 1
      end

      it "redirect to root path" do
        expect(response).to redirect_to(root_path)
      end

      it "shows success message" do
        expect(flash[:notice]).to be_present
        expect(flash[:notice]).to eq "You have voted for #{candidate.name}!"
      end
    end

    context "unsuccessfully created vote" do
      let(:current_user) { user }
      before do
        session[:current_user_id] = user.id
        post :create, :vote => { user: current_user }
      end

      it "shows error message" do
        expect(flash[:notice]).to be_present
        expect(flash[:notice]).to eq "Sorry, vote was not saved."
      end
    end
  end
end
