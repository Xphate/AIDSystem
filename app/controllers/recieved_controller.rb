class RecievedController < ApplicationController
  def nav

  end

  def index
    @user=current_user
    @messages=Message.where(:tousername => @user.username)
  end

  def show
  end
end
