class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, index: true
      t.string :taggable_type
      t.integer :taggable_id

      t.timestamps null: false
    end
    add_index :taggings, [:taggable_type, :taggable_id]
    add_foreign_key :taggings, :tags
  end
end
