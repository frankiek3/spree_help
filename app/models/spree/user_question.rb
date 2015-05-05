class Spree::UserQuestion < Spree::Base
  belongs_to :question_category, class_name: 'Spree::QuestionCategory'
  belongs_to :question, class_name: 'Spree::Question'
  if Spree.user_class
    belongs_to :user, class_name: Spree.user_class.to_s
  else
    belongs_to :user
  end

  validates :user_question, presence: true, length: { in: 4..1000, too_long: "%{count} characters is the maximum allowed" }
  validates :user, presence: true, if: 'email.blank?'
  validates :email, presence: true, if: 'user_id.blank?', format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  accepts_nested_attributes_for :question, reject_if: proc { |question| question[:question].blank? }



  #include ActiveModel::Conversion
  #include ActiveModel::Validations

  #attr_accessor :email, :message, :name, :subject

  #EMAIL_REGEX = /\A
    #[^\s@]+ # non-at-sign characters, at least one
    #  @     # at-sign
    #[^\s.@] # non-at-sign and non-period character
    #[^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
    # \.     # period
    #[^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
    #[^\s.@] # non-at-sign and non-period character
  #\z/x

      #validates :email, :format => { :with => EMAIL_REGEX }, :presence => true
      #validates :message, :presence => true
      #validates :name, :presence => {:if => Proc.new{SpreeContactUs.require_name}}
  #validates :subject, :presence => {:if => Proc.new{SpreeContactUs.require_subject}}

  #def initialize(attributes = {})
  #  [:email, :message, :name, :subject].each do |attribute|
  #    self.send("#{attribute}=", attributes[attribute]) if attributes and attributes.has_key?(attribute)
  #  end
  #end

  #def save
  #  if self.valid?
      #Spree::ContactUs::ContactMailer.contact_email(self).deliver
  #    return true
  #  end
  #    return false
  #end

  #def persisted?
  #  false
  #end
end
#      t.references :question_category
#      t.text       :link
#      t.text       :question
#      t.references :user
#      t.datetime   :submitted_at
#      t.boolean    :answered


