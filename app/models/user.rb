class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre

  validates :nickname, presence: true

  def self.chart_data(user_id)
    @books = Book.where(user_id: user_id)
    ary = []
    @books.each do |i|
      ary.push(Genre.find_by(id: i.genre_id)[:name])
    end
    ary.group_by(&:itself).map{|key, value|[key, value.count]}.to_h
  end


end
