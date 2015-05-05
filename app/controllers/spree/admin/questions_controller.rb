module Spree
  module Admin
    class QuestionsController < ResourceController
      before_action :question, only: [:new, :edit]

      def index
        @questions = collection
      end

      def destroy
        @question = Spree::Question.find(params[:id])
        @question.destroy
        render nothing: true
      end

      private

      def collection
        params[:q] ||= {}
        @search = Spree::Question.ransack(params[:q])
        @collection = @search.result.includes([:question_category]).page(params[:page]).per(params[:per_page])
      end

      def question
        @question ||= @object
      end

      def safe_params
        [
          :question_category_id,
          :question,
          :answer,
          :active
        ]
      end

      def question_params
        params.require(:question).permit(*safe_params)
      end


    end
  end
end
