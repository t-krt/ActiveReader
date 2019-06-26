class DropTablesBookcategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :book_categories
  end
end
