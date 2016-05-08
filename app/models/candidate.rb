class Candidate < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
  validates :party, presence: true
  validates :image_url, presence: true

  def percentage_votes
    (votes.count.to_f/ total_votes.to_f) * 100
  end

  def percentage_votes_humanized
    "#{percentage_votes}%"
  end

  def total_votes
    Vote.count
  end
end
