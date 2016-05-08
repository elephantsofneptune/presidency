class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate

  validates :user_id, presence: true
  validates :candidate_id, presence: true
end
