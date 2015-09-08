class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(5)
  end 

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def create
    @user = User.new(user_params)
    @user.admin = (user_params[:admin] == "1" ? true : false )

    if @user.save 
      redirect_to admin_users_path, notice: "#{@user.firstname} #{@user.lastname} was submitted successfully!"
    else
      render :new
    end 
  end 

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user)
    else 
      render :edit
    end 
  end 

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      UserMailer.post_user_delete_email(@user).deliver
    end 
    redirect_to admin_users_path
  end 


  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end 
end
