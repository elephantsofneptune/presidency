require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "record creation" do

    it "must have name, party and image_url columns" do
      is_expected.to have_db_column(:name).of_type(:string)
      is_expected.to have_db_column(:party).of_type(:string)
      is_expected.to have_db_column(:image_url).of_type(:string)
    end

    context "cannot be created without a party" do
      When(:candidate) { Candidate.create(name: "Donald Tramp",
                                          image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }
      Then { candidate.valid? == false }
    end

    context "cannot be created without a name" do
      When(:candidate) { Candidate.create(party: "Repooplican",
                                          image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }
      Then { candidate.valid? == false }
    end

    context "cannot be created without a image url" do
      When(:candidate) { Candidate.create(name: "Donald Tramp",
                                          party: "Repooplican") }
      Then { candidate.valid? == false }
    end

    context "can be created when all parameters are present" do
      When(:candidate) { Candidate.create(
        name: "Donald Tramp",
        party: "Repooplican",
        image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg"
      )}
      Then { candidate.valid? == true }
    end
  end

  context "returns calculated votes" do
    let(:user) { User.create(name: "test_name", email: "josh@nextacademy.com") }
    let(:candidate) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg") }

    it "calculate candidate percentage votes" do
      Vote.create!(user_id: user.id, candidate_id: candidate.id)
      expect(candidate.percentage_votes).to eq(100.0)
    end

    it "calculate total votes" do
      Vote.create!(user_id: user.id, candidate_id: candidate.id)
      expect(candidate.total_votes).to eq(1)
    end
  end
end
