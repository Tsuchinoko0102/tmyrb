class UsersController < ApplicationController

  def show
    @books = Book.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :prefecture_id, :works, :genre_id, :likes_author,
                  :likes_book, :appeal_text)
  end

end
