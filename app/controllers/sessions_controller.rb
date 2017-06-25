class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase.to_s)

    if user && user.authenticate(params[:session][:password].to_s)
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to admin_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
