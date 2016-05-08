require 'rails_helper'

RSpec.describe User, type: :model do
  context "record creation" do
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
end
