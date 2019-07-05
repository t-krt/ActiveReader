class AddUrlToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :url, :string
    add_column :books, :isbn, :string, unique: true
  end
end
