module Spree
  module Admin
    class UserQuestionsController < ResourceController
      before_filter :build_question, only: [:edit]
      before_action :new_user_question, only: [:edit]

      def index
        redirect_to spree.admin_question_categories_path, notice: Spree.t(:new_question_created)
        #@question_categories = collection
        #@user_questions = Spree::UserQuestion.all
      end

      private

      def build_question
	@user_question.question ||= Spree::Question.new
      end

      def collection
        params[:q] ||= {}
        @search = Spree::UserQuestion.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end

      def new_user_question
        @user_question ||= @object
        @question_categories = Spree::QuestionCategory.all
      end

      def safe_params
        [
          :question_category_id,
          :link,
          :user_question,
          :user_id,
          :email,
          :question_id
        ]
      end

      def user_question_params
        params.require(:user_question).permit(*safe_params)
        #params.require(:question_category).permit(:questions_attributes, :question, :answer, question: [:question_category_id, :question, :answer])
      end


    end
  end
end
