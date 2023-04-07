class UsersController < ApplicationController
  def index_creator
    @creator = User.all
  end

  def show_user
    @user = User.find_by(email:current_user.email)
  end

end
