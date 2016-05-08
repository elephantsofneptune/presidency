class SessionsController < ApplicationController
  def show
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.valid?
      session[:current_user_id] = @user.id
      redirect_to root_path, flash: { notice: "Welcome to the Presidential Voting System, #{@user.name}!" }
    else
      redirect_to sessions_path, flash: { notice: "Login details was incomplete." }
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to sessions_path, flash: { notice: "You have successfully logged out." }
  end

  private
  def user_params
    params[:user][:name] && params[:user][:name].downcase!
    params[:user][:email] && params[:user][:email].downcase!
    params.require(:user).permit(:name, :email)
  end
end
