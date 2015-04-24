class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :spree_questions do |t|
      t.references :question_category
      t.text    :question
      t.text    :answer
      t.integer :position

      t.timestamps
    end
  end
end
#add_index
