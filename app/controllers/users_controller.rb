class UsersController < ApplicationController

  def show
    @books = Book.where(user_id: current_user.id)
  end

  def edit
  end

end
