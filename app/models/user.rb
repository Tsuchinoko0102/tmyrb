class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre

  validates :nickname, presence: true

end
