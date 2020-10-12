class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title      , null: false
      t.string :author     , null: false
      t.integer :genre_id  , null: false
      t.text :content      , null: false
      t.integer :rank_id   , null: false
      t.string  :publish   , null: false
      t.references :user   , null: false, forein_key: true
      t.timestamps
    end
  end
end
