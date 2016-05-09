module VotesHelper
  def total_votes
    Vote.count
  end
end
