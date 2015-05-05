class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :spree_question_categories do |t|
      t.string  :name
      t.integer :position
      t.references :taxonomy

      t.timestamps null: false
    end
  end
end
#add_index
