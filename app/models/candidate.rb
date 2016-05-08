class Candidate < ActiveRecord::Base
  validates :name, presence: true
  validates :party, presence: true
end
