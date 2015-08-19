class Admin::UsersController < ApplicationController

  before_filter :restrict_access

  def index
    @users = User.all.page(params[:page]).per(5)
  end 

  def show
    @user = User.find(params[:id])
  end 
end
