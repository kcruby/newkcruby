class SessionsController < ApplicationController
  def new
    if signed_in?
        redirect_to root_path
    end
  end

  def create
     if signed_in?
        redirect_to root_path
     end
     user = User.find_by(email: params[:session][:email].downcase)
  	 if user && user.authenticate(params[:session][:password])
  	   sign_in user
       redirect_back_or user
     else
       flash[:notice] = "Invalid email/password combination"
       redirect_to new_session_path
  	 end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
