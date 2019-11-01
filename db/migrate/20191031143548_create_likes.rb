class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :review, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
