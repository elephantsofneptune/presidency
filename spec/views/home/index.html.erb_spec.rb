require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  before do
    assign(:vote, Vote.new)
    assign(:candidates, [
      Candidate.create!(name: "Donald Tramp", party: "Repooplican", image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/trump-square-150.jpg"),
      Candidate.create!(name: "Hillary Clickton", party: "Demobrats", image_url: "http://graphics8.nytimes.com/newsgraphics/2015/01/30/candidate-tracker/assets/images/clinton-square-150.jpg")
    ])
  end

  it 'has h1 title' do
    render
    expect(rendered).to match /2016 Presidential Election/
  end

  xit "displays a list of presidential candidates" do
    render

    # watch out for capitalization
    expect(rendered).to match /Donald Trump/
    expect(rendered).to match /Repooplican/
    expect(rendered).to match /Hillary Clickton/
    expect(rendered).to match /Demobrats/
  end

  it "displays form with list of presidential candidates, sets candidate id when checkbox is true" do
    user = User.create(name: "Josh", email: "josh@nextacademy.com")

    render

    expect(rendered).to have_selector('form') do |form|
      expect(form).to have_selector('input',
                                :type => 'submit')
      expect(form).to have_selector('label')
    end
    expect(rendered).to match /Donald Tramp, Repooplican/
  end

  it "displays vote count" do
  end
end
