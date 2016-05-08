class Candidate < ActiveRecord::Base
  validates :name, presence: true
  validates :party, presence: true
  validates :image_url, presence: true
end
