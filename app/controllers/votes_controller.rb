class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def create
    @vote = Vote.new(candidate_id: params[:vote][:candidate],
                     user_id: @current_user.id)
    if @vote.save
      redirect_to root_path, flash: { notice: "You have voted for #{@vote.candidate.name}!" }
    else
      redirect_to root_path, flash: { notice: "Sorry, vote was not saved." }
    end
  end
end
