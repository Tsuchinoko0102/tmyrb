class BooksController < ApplicationController
  def index
  end

  def new
    if session["title"].present? && session["author"].present?
      @set_title = session["title"]
      @set_author = session["author"]
      binding.pry
      Book.new(title: @set_title, author: @set_author)
    else
      Book.new
    end
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
    session["search_word"] = @search_word
    @items = RakutenWebService::Books::Book.search(title: session["search_word"])
    session["search_word"]
  end

  def rakuten_select
    @search_word = session["search_word"]
    @items = RakutenWebService::Books::Book.search(title: session["search_word"])
    num = params[:selected].to_i
    session["title"] = @items.response["Items"][num]["title"]
    session["author"] = @items.response["Items"][num]["author"]
    redirect_to new_book_path
  end

end