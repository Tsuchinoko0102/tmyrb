class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :session_delete, only: [:index, :show, :edit, :update, :destroy]

  def after_sign_in_path_for(resource)
    root_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys:[:nickname, :prefecture_id, :works, :genre_id, :likes_author,
        :likes_book, :appeal_text])
  end

  protected
  def session_delete
    if session["search_word"].present? || session["title"].present? || session["author"].present?
      session["search_word"].clear
      session["title"].clear
      session["author"].clear
      session["largeImageUrl"].clear
      session["itemUrl"].clear
    end
  end
end
