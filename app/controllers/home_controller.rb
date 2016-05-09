class HomeController < ApplicationController
  def index
    require_login unless @current_user

    @candidates = Candidate.by_popularity
    @vote = Vote.new
  end
end
