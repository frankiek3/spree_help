class Spree::HelpController < Spree::StoreController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  helper 'spree/products'

#ssl_allowed
#skip_before_filter :set_current_order, only: :show
#prepend_before_filter :load_object, only: [:show, :edit, :update]
#prepend_before_filter :authorize_actions, only: :new
#include Spree::Core::ControllerHelpers


#  before_filter :load_resource, only: [:]
#  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  respond_to :html

  def index
    
  end

  def show_faq
    @categories = Spree::QuestionCategory.includes(:questions).load
    respond_with(@categories) do |format|
      format.html { render :faq }
    end
  end

  def show_user_questions
  end

  def new_user_question
      @user_question ||= Spree::UserQuestion.new

#      invoke_callbacks(:new_action, :before)
      respond_with(@user_question) do |format|
        format.html { render layout: !request.xhr? }
        if request.xhr?
          format.js { render layout: false }
        end
      end
#    else
#      render :edit
    end

#    else
#      flash[:error] = populator.errors.full_messages.join(" ")
#      redirect_to :back
#    end
  end

  def update_user_question
    if @user.update_attributes(user_params)
    if params[:user][:password].present?
      user = Spree::User.reset_password_by_token(params[:user])
    end
    redirect_to spree.account_url, notice: Spree.t(:account_updated)
  end


  def default_title
    Spree.t(:help, scope: :spree_help)
  end


  private

  def load_object
    @user ||= spree_current_user
    if @user
      authorize! params[:action].to_sym, @user
    else
      redirect_to spree.login_path
    end
  end

  def authorize_actions
    authorize! params[:action].to_sym, Spree::User.new
  end

  def accurate_title
    Spree.t(:help)
  end

end
