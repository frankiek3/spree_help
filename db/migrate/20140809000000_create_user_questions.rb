class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :spree_user_questions do |t|
      t.references :question_category
      t.text       :link
      t.text       :user_question
      t.references :user
      t.text       :email
      t.references :question

      t.timestamps null: false
    end
  end
end
#add_index :spree_user_questions, [:question_category_id], :name => 'index_spree_user_questions_on_question_category_id'
