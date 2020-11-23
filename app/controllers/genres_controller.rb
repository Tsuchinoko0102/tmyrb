class GenresController < ApplicationController
  # genreselect.jsによるAjaxリクエストのレシーバ
  def genre_select
    @genre = params[:num].to_i - 2
    render partial: "templates/genre", locals: {genre: @genre}
  end
end
