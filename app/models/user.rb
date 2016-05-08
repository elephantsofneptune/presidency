class User < ActiveRecord::Base
  has_one :vote
  validates :name, presence: true
  validates :email, presence: true

  def voted?
    vote.present?
  end
end
