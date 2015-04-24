class Spree::QuestionCategory < Spree::Base
  has_many :questions, class_name: 'Spree::Question'
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc { |question| question[:question].blank? }
end
