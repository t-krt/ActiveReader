class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content, null: false
      t.boolean :finished, default: false, null: false
      t.date :limit
      t.references :review, foreign_key: true
      t.timestamps
    end
  end
end
