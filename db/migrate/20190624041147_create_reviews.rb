class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :purpose, null: false
      t.text :learned
      t.text :note
      t.integer :rate
      t.integer :review_status, null: false
      t.date :deadline
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.timestamps
    end
  end
end
