class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :image_url
      t.string :url
      t.string :isbn, unique: true
      t.timestamps
    end
  end
end
