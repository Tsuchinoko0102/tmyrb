class BooksController < ApplicationController
  skip_before_action :session_delete, except: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    if session["title"].present? && session["author"].present?
      @set_title = session["title"]
      @set_author = session["author"]
      @set_image = session["largeImageUrl"]
      @set_url = session["itemUrl"]
      @book = Book.new(title: @set_title, author: @set_author, image: @set_image, url: @set_url)
    else
      @book = Book.new
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @hoge = @book.content
  end

  def edit
    @book = Book.find(params[:id])
    @set_title = @book.title
    @set_author = @book.author
    @set_image = @book.image
    @set_url = @book.url
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to root_path
    end
  end

  def rakuten_search
    @search_word = params[:title]
    if @search_word.present?
      session["search_word"] = @search_word
      @items = RakutenWebService::Books::Book.search(title: session["search_word"])
    else
      render :new
    end
  end

  def rakuten_select
    @search_word = session["search_word"]
    @items = RakutenWebService::Books::Book.search(title: session["search_word"])
    num = params[:selected].to_i
    select_book = @items.response["Items"][num]
    session["title"] = select_book["title"]
    session["author"] = select_book["author"]
    session["largeImageUrl"] = select_book["largeImageUrl"]
    session["itemUrl"] = select_book["itemUrl"]
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :content, :rank_id, :publish, :image, :url, :lead).merge(user_id: current_user.id)
  end

  
end