require 'rails_helper'

RSpec.describe User, type: :model do
  context "record creation" do
    it "should have name and email" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
    end

    context "cannot be created without a name" do
      When(:user) { User.create(email: "josh@nextacademy.com") }
      Then { user.valid? == false }
    end

    context "cannot be created without a email" do
      When(:user) { User.create(name: "Josh Teng") }
      Then { user.valid? == false }
    end

    context "can be created when both parameters are present" do
      When(:user) { User.create(
        name: "Josh Teng",
        email: "josh@nextacademy.com"
      )}
      Then { user.valid? == true }
    end
  end

  context "validations for user" do
    let(:user1) { User.create(name: "Josh Geng", email: "josh@nextacademy.com")}
    let(:user2) { User.create(name: "Delilah",email: "delilah.com") }

    it "cannot sign up with duplicated emails" do
      should validate_uniqueness_of(:email)
    end

    it "sign up with valid email" do
      expect(user1).to be_valid
    end

    it "sign up with invalid email" do
      expect(user2).to be_invalid
    end
  end
end
