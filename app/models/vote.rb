class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate, counter_cache: true

  validates :user_id, presence: true, uniqueness: true
  validates :candidate_id, presence: true
end
