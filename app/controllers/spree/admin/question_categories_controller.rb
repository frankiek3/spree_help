module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_filter :build_questions, only: [:edit]
      before_action :question_category, only: [:new, :edit]

      def index
        @question_categories = collection
        @user_questions = Spree::UserQuestion.all
      end

      def update_question_positions
        params[:positions].each do |id, index|
          Spree::Question.find(id).update_attributes(position: index)
        end

        respond_to do |format|
          format.html { redirect_to spree.admin_question_categories_path }
          format.js { render text: 'Ok' }
        end
      end

      private

      def build_questions
	@question_category.questions.build if @question_category.questions.empty?
      end

      def collection
        params[:q] ||= {}
        @search = Spree::QuestionCategory.ransack(params[:q])
        @collection = @search.result.includes([:questions]).page(params[:page]).per(params[:per_page])
      end

      def question_category
        @question_category ||= @object
        @taxons = Spree::Taxon.all
      end

      def safe_params
        [
          :name
        ]
      end

      def question_category_params
        params.require(:question_category).permit(*safe_params)
        #params.require(:question_category).permit(:questions_attributes, :question, :answer, question: [:question_category_id, :question, :answer])
      end


    end
  end
end
