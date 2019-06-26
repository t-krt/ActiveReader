class RemoveDetailFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :detail, :text
  end
end
