class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category

  PASS_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze

  validates :nickname, presence: true
  validates :email, uniqueness: { case_sensitive: true, message: 'has already been taken' }
  validates :password, length: { minimum: 6 }



  def self.chart_data(user_id)
    @books = Book.where(user_id: user_id)
    ary = []
    @books.each do |i|
      num = i.genre_id.to_i
      ary.push(Genre.target(num))
    end
    ary = ary.group_by(&:itself).map{|key, value|[key, value.count]}.to_h
    ary = ary.map{|hash, count| [hash[:name], count]}
  end


end
