class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.string :title, limit: 1024
      t.text :body

      t.timestamps
    end
  end
end
