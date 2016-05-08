class HomeController < ApplicationController
  def index
    require_login unless @current_user

    @candidates = Candidate.all
    @vote = Vote.new
  end
end
