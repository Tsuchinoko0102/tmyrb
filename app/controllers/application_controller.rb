class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys:[:nickname, :prefecture_id, :works, :genre_id, :likes_author,
        :likes_book, :appeal_text])
  end
end
