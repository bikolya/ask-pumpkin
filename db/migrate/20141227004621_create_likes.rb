class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.boolean :positive, default: true
      t.string :likable_type
      t.integer :likable_id

      t.timestamps null: false
    end
    add_index :likes, [:likable_type, :likable_id]
  end
end
