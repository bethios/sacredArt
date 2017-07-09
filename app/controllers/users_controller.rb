class UsersController < ApplicationController
  before_action :authorize_user
  before_action :find_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.update_attributes(user_params)
      flash[:notice] = "Welcome #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "User info was updated."
      redirect_to admin_path
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end

  def find_user
    @user = User.find(params[:id].to_i)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
