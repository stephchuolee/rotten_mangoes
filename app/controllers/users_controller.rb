class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = (user_params[:admin] == "1" ? true : false )
    if @user.save 
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else 
      render :new
    end 
  end

  def show
    @user = User.find(params[:id])  
  end 

  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end 
end
