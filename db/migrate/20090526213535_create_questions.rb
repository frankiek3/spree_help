class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :spree_questions do |t|
      t.references :question_category
      t.text    :question
      t.text    :answer
      t.integer :position
      t.boolean :active, :default => false

      t.timestamps null: false
    end
  end
end
#add_index
