require 'rails_helper'

RSpec.describe "votes/index.html.erb", type: :view do
  let(:user) { User.create(name: "You Jing", email: "youjing@nextacademy.com") }
  let(:candidate) { Candidate.create(name: "Donald Tramp", party: "Repooplican", image_url: "https://placehold.it/300.png/09f/fff") }
  let(:vote) { Vote.create(candidate: candidate, user: user) }
  before do
    assign(:votes, [vote])
  end

  context "displays list of votes" do
    it 'has h1 title' do
      render
      expect(rendered).to match /Voters List/
    end

    it "displays index number" do
      render
      expect(rendered).to match /1/
    end

    it "displays voter name" do
      render
      expect(rendered).to match /You Jing/
    end

    it "displays candidate name" do
      render
      expect(rendered).to match /Donald Tramp/
    end

    it "displays party" do
      render
      expect(rendered).to match /Repooplican/
    end

    it "displays as a table" do
      render
      expect(rendered).to have_css("table")
      expect(rendered).to have_css("thead tr th", :count=>4)
      expect(rendered).to have_css("tbody tr td", :count=>4)
    end
  end
end
