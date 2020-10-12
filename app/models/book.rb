class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :rank

  with_options presence: true do
    validates :title
    validates :genre_id
    validates :author
    validates :content
    validates :rank_id
    validates :publish
    validates :user
  end

  with_options numericality: {other_than: 1} do
    validates :rank_id
    validates :genre_id
  end

end

