require 'rails_helper'

RSpec.describe "sessions/show.html.erb", type: :view do
  it "displays the login screen" do
    render

    expect(rendered).to match /Name/
    expect(rendered).to match /Email/
  end
end
