class HomeController < ApplicationController
  def index
    require_login unless @current_user
  end
end
