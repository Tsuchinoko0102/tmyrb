class BooksController < ApplicationController
  skip_before_action :session_delete, except: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
      @books = Book.where.not(user_id: current_user.id).order(created_at: :DESC)
      @genre = Genre.target(@user.genre_id)
    else
      @books = Book.all.order(created_at: :DESC)
    end
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
    @pie = User.chart_data(params[:id])
    @genre = Genre.target(@book.genre_id)
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

  def new_pdf 
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@book.title}"   # Excluding ".pdf" extension.
      end
    end
  end

  # tabchange.jsによるAjaxリクエストのレシーバ
  def tabchange
    # Ajaxで送信されてきたデータ（タブの表示名）をtab_idに格納
    tab_id = params[:content].to_i
    @user = User.find(current_user.id)
    # 送信されてきたtab_idを引数にgenre_targetメソッドを動かし、対象のジャンルを抽出して@books変数に代入
    @genre = Genre.target(tab_id)
    # @genreがHashだった場合は、@genre[:id]をgenre_idとして検索。「すべての投稿」は@genreがAryになるのでelseを返す
    if @genre.kind_of?(Hash)
      @books = Book.where.not(user_id: current_user.id).where(genre_id: @genre[:id]).order(created_at: :DESC)
    else
      @books = Book.where.not(user_id: current_user.id).order(created_at: :DESC)
    end
   
    # このメソッドで定義された@books変数を適用したpartialをtabchange.jsに返却
    render partial: "/templates/other_books", collection: @books, as: :b
  end

  # genreselect.jsによるAjaxリクエストのレシーバ
  def genre_select
    @genre = params[:num].to_i - 2
    render partial: "templates/genre", locals: {genre: @genre}
  end

  
  private
  # genre_idはform_withと別に、Ajaxでpartialをrenderして拾うのでmergeメソッドによって取得
  def book_params
    params.require(:book).permit(:title, :author, :content, :rank_id, :publish, :image, :url, :lead)
    .merge(user_id: current_user.id, genre_id: params[:genre_id])
  end

  
end