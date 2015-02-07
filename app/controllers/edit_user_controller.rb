class EditUserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user=current_user
  end

  def edit
  end


  def show
    current_user.username=params[:username]
    current_user.realname=params[:realname]
    current_user.phonenumber=params[:phonenumber]
    current_user.job=params[:job]
    current_user.save
    @user=current_user
  end
end
