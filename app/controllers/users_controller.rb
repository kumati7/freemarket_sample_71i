class UsersController < ApplicationController
  def show
    @user = User.where(user_id: current_user)
  end


  def edit
  end
end
