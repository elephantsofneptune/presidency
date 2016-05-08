class Candidate < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
  validates :party, presence: true
  validates :image_url, presence: true
end
