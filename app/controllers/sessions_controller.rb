class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid E-mail/Password Combination"
      render 'new'
    end 
  end 
  def destroy
    logged_out 
    redirect_to root_url 
  
  end 
end
