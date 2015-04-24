class Spree::UserQuestion < Spree::Base
  validates :question, presence: true
end

#      t.references :question_category
#      t.text       :link
#      t.text       :other
#      t.text       :question
#      t.references :user
#      t.datetime   :submitted_at
#      t.boolean    :answered


