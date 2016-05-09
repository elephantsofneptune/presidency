require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "record creation" do

    it "must have name, party and image_url columns" do
      is_expected.to have_db_column(:name).of_type(:string)
      is_expected.to have_db_column(:party).of_type(:string)
      is_expected.to have_db_column(:image_url).of_type(:string)
    end

    it "has a counter for votes" do
      is_expected.to have_db_column(:votes_count).of_type(:integer)
    end

    context "cannot be created without a party" do
      When(:candidate) { Candidate.create(name: "Donald Tramp",
                                          image_url: "https://placehold.it/300.png/09f/fff") }
      Then { candidate.valid? == false }
    end

    context "cannot be created without a name" do
      When(:candidate) { Candidate.create(party: "Repooplican",
                                          image_url: "https://placehold.it/300.png/09f/fff") }
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
        image_url: "https://placehold.it/300.png/09f/fff"
      )}
      Then { candidate.valid? == true }
    end
  end

  context "returns calculated votes" do
    let(:user) { User.create(name: "Tom", email: "tom@nextacademy.com") }
    let(:candidate) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "https://placehold.it/300.png/09f/fff") }

    it "calculate candidate percentage votes" do
      Vote.create!(user_id: user.id, candidate_id: candidate.id)
      expect(candidate.percentage_votes).to eq(100.0)
    end
  end

  context "ensures votes percentage is rounded to one decimal" do
    let(:user1) { User.create(name: "SSY", email: "ssy@nextacademy.com") }
    let(:candidate1) { Candidate.create!(name: "Donald Tramp",
                                        party: "Repooplican",
                                        image_url: "https://placehold.it/300.png/09f/fff") }

    let(:user2) { User.create(name: "Ping", email: "ping@nextacademy.com") }
    let(:candidate2) { Candidate.create!(name: "Najib",
                                        party: "Lazat",
                                        image_url: "https://placehold.it/300.png/09f/fff") }

    let(:user3) { User.create(name: "Syafiz", email: "syafiz@nextacademy.com") }
    let(:candidate3) { Candidate.create!(name: "Frank",
                                        party: "Underwood",
                                        image_url: "https://placehold.it/300.png/09f/fff") }


    it "rounds to one decimal" do
      Vote.create!(user_id: user1.id, candidate_id: candidate1.id)
      Vote.create!(user_id: user2.id, candidate_id: candidate2.id)
      Vote.create!(user_id: user3.id, candidate_id: candidate3.id)
      expect(candidate3.percentage_votes).to eq(33.3)
    end
  end
end
