class SessionsController < ApplicationController
  def new
    #non-model backed-form, nothing here
  end

  def create
    # 1. get the user obj
    # 2. see if the password matches
    # 3. if so, log in
    # 4. if not, error message

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in!"
    else
      flash[:error] = "There is something wrong"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to main_path
  end
end