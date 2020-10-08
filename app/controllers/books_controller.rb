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
    binding.pry
    @search_word = params[:title]
    @items = RakutenWebService::Books::Book.search(title: @search_word)
    @items.first(10).each do |item|
      puts "#{item['itemName']}"
    end
    binding.pry
  end
end