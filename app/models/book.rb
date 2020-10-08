class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :title
    validates :genre_id
    validates :author
    validates :content
    validates :rank
    validates :publish
  end

  validates :genre_id, numericality: {other_than: 1}
  

end

