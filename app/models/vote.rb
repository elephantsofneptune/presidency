class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate, counter_cache: true

  validates :user_id, presence: true, uniqueness: true
  validates :candidate_id, presence: true

  scope :search, -> (query) {
    return if query.blank?;
    joins(:candidate, :user).
    where("candidates.name ILIKE :query or candidates.party ILIKE :query or users.name ILIKE :query", query: "%#{query}%") }
end
