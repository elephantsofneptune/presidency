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

  it "displays form with list of presidential candidates" do
    render
    expect(rendered).to match /Donald Tramp, Repooplican/
    expect(rendered).to match /Hillary Clickton, Demobrats/
  end

  it "has logout link" do
    render
    expect(rendered).to have_link("Logout", href: sessions_path)
  end

  it "displays a voting form with radio inputs" do
    render
    expect(rendered).to have_selector('form') do |form|
      expect(form).to have_selector('input[type=radio]',
                                :type => 'submit',
                                :value => candidates.first.id)
    end
  end
end
