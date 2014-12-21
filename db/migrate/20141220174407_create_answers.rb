class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.text :body
      t.boolean :best, default: false

      t.timestamps
    end

    add_index :answers, :question_id
  end
end
