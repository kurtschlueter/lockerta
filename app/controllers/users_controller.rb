class UsersController < ApplicationController
  def create
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to JerseyTalk! You are now registered!"
      redirect_to "/"
    else
      flash[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :school_id, :sport, :jersey_number)
  end
end