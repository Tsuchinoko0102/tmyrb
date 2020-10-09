class BooksController < ApplicationController
  def index
  end

  def new
    Book.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def rakuten_search
    @search_word = params[:title]
    @items = RakutenWebService::Books::Book.search(title: @search_word)
  end
end