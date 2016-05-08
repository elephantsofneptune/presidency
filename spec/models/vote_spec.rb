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
end
