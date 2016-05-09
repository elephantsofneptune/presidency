class User < ActiveRecord::Base
  has_one :vote
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {
                        with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                      }

  def voted?
    vote.present?
  end
end
