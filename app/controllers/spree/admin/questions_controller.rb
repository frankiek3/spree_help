module Spree
  module Admin
    class QuestionsController < ResourceController
      def destroy
        @question = Spree::Question.find(params[:id])
        @question.destroy
        render nothing: true
      end
    end
  end
end
