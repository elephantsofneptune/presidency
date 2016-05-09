class Candidate < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
  validates :party, presence: true
  validates :image_url, presence: true

  scope :by_popularity, -> { order('votes_count DESC') }

  def percentage_votes
    percentage = (votes.count.to_f/ total_votes.to_f) * 100
    percentage.round(1)
  end

  def total_votes
    Vote.count
  end

  def percentage_votes_humanized
    "#{percentage_votes}%"
  end
end
