class UsersController < ApplicationController

  def index
    if user_signed_in?
      @books = Book.where.not(user_id: current_user.id).order(created_at: :DESC)
    else
      @books = Book.all.order(created_at: :DESC)
    end
  end
  
  def show
    @books = Book.where(user_id: current_user.id)
    @pie = User.chart_data(params[:id])
    binding.pry
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
