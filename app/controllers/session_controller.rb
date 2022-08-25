class SessionController < ApplicationController
  def new 

  end

  def create 
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = "Success"
      redirect_to root_path
    else
      flash.now[:error] = "Something is wrong with your information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:success] = "Logout success"
    redirect_to login_path
  end
end
