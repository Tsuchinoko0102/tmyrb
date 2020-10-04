class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title   , null: false
      t.integer :genre  , null: false
      t.string :author  , null: false
      t.text :content   , null: false
      t.integer :rank   , null: false
      t.integer :pubkish, null: false
      t.timestamps
    end
  end
end
