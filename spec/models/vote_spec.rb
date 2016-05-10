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
    let(:user) { User.create(name: "Josh Teng", email: "josh@nextacademy.com") }
    let(:candidate) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "https://placehold.it/300.png/09f/fff") }

    When(:vote) { Vote.create(candidate: candidate, user: user) }
    Then { vote.valid? == true }
  end

  describe "#search" do
    let(:user) { User.create(name: "Josh Teng", email: "josh@nextacademy.com") }
    let(:user2) { User.create(name: "Wei Jia", email: "weijia@nextacademy.com") }
    let(:candidate) { Candidate.create(name: "Donald Tramp",
                                       party: "Repooplican",
                                       image_url: "https://placehold.it/300.png/09f/fff") }

    let(:candidate2) { Candidate.create(name: "Frank Underwood",
                                       party: "Repooplican",
                                       image_url: "https://placehold.it/300.png/09f/fff") }

    let(:vote) { Vote.create(candidate: candidate, user: user) }
    let(:vote2) { Vote.create(candidate: candidate2, user: user2) }
    it "returns results when user name is searched" do
      vote.reload
      result = Vote.search("josh")
      expect(result.count).to eq 1
    end

    it "returns results when candidate name is searched" do
      vote.reload
      result = Vote.search("don")
      expect(result.count).to eq 1
    end

    it "returns results when candidate party is searched" do
      vote.reload
      vote2.reload
      result = Vote.search("repoop")
      expect(result.count).to eq 2
    end
  end

  context "validations for vote" do
    let(:user) { User.create(name: "Josh Teng", email: "josh@nextacademy.com") }
    let(:candidate) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }

    When(:vote) { Vote.create(candidate: candidate, user: user) }
    it "user can only vote once" do
      should validate_uniqueness_of(:user_id)
    end
  end
end
