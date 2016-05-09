require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VotesHelper. For example:
#
# describe VotesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe VotesHelper, type: :helper do
  describe "total votes" do
    it "calculates total votes" do
      expect(helper.total_votes).to eq(Vote.count)
    end
  end
end
