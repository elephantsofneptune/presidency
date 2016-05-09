require 'rails_helper'

RSpec.describe Vote, type: :model do
  context "record creation" do
    it "belongs to a voter" do
      should have_db_column(:user_id).of_type(:integer)
    end

    it "belongs to a candidate" do
      should have_db_column(:candidate_id).of_type(:integer)
    end
  end

  context "cannot be created without a candidate" do
    When(:vote) { Vote.create(user: stub_model(User)) }
    Then { vote.valid? == false }
  end

  context "cannot be created without a user" do
    When(:vote) { Vote.create(candidate: stub_model(Candidate)) }
    Then { vote.valid? == false }
  end

  context "can be created when both user and candidate are present" do
    let(:user) { User.create(name: "test_name", email: "josh@nextacademy.com") }
    let(:candidate) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }

    When(:vote) { Vote.create(candidate: candidate, user: user) }
    Then { vote.valid? == true }

    it "user can only vote once" do
      should validate_uniqueness_of(:user_id)
    end
  end
end
