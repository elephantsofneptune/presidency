class AddVotesCountToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :votes_count, :integer, default: 0
  end
end
