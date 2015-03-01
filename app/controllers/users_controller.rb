class UsersController < ApplicationController
  def new 
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifier.send_signup_email(@user).deliver
        session[:user_id] = @user.id
        redirect_to '/'
    else
        render :new
    end
  end

  private 
    def user_params
      params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
    end
end
