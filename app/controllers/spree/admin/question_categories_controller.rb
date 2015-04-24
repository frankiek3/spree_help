module Spree
  module Admin
    class QuestionCategoriesController < ResourceController
      before_filter :build_questions, only: [:new, :edit]

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
        @taxons = Spree::Taxon.all
      end

      def question_category_params
        params.require(:question_category).permit(:questions_attributes, :question, :answer, question: [:question_category_id, :question, :answer])
      end
    end
  end
end
