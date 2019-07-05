class RenameImageColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :image, :image_url
  end
end
