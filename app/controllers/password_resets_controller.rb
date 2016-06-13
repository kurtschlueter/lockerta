class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:info] = "Email sent with password reset instructions."
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
    if !@user
      render :not_found
    end
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    puts '-------------------------------------'
    puts @user
    puts params
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:errors] = ['Password reset has expired.']
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif params[:user][:password].length < 6 || params[:user][:password].length > 20
      flash.now[:errors] = ['Password must be between 6 and 20 characters.']
      render :edit
    elsif @user.update_attributes(password: params[:user][:password])
      flash[:success] = 'Password has been reset!'
      redirect_to root_url
    else
      render :edit
    end
  end
end
