require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "record creation" do
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
      When(:candidate) { Candidate.create(name: "Donal Tramp",
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

  # Given(:giver) { User.create(name: "Tristan", email: "tristan@parasquid.com") }
  # Given(:receiver) { User.create(name: "Josh", email: "josh@nextacademy.com") }
  # Given(:gift) {
  #   Gift.create(
  #     name: "1up Mushroom",
  #     image_url: "http://newsupermariobros2.nintendo.com/_ui/img/coin-rush/mushroom.png"
  #   )
  # }
  # Given(:message) { "Thank you for building NextAcademy and giving everyone the gift of code!" }

  # context "a user can give a gift to another user" do
  #   When { giver.give(gift, to: receiver, message: message) }
  #   Then { giver.gifts_given.count == 1 }

  #   context "giving more than one gift accumulates a user's gifts_given tally" do
  #     When { giver.give(gift, to: receiver, message: message) }
  #     Then { giver.gifts_given.count == 2 }
  #   end

  #   context "the receiver accumulates the number of gifts received" do
  #     Then { receiver.gifts_received.count == 1 }
  #   end
  # end

  # context "can show all users aside from the current user" do
  #   Given {
  #     10.times do |x|
  #       User.create(name: x, email: "#{x}@nextacademy.com")
  #     end
  #   }
  #   Given(:this_user) { User.create(name: "this_user", email: "hello@nextacademy.com") }
  #   When(:other_users) { this_user.other_users }
  #   Then { expect(other_users).to_not include(this_user) }
  #   And { other_users.count == 10 }
  # end
end
