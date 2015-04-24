module Spree
  class FaqsController < StoreController
    helper 'spree/products'

    def faq
      @categories = QuestionCategory.includes(:questions).load
    end

    def help
      @user_question = UserQuestion.new
    end

    def user_question
    end

    def default_title
      Spree.t(:frequently_asked_questions, scope: :spree_help)
    end
  end
end
