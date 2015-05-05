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
  respond_to :html, :js


  def index
    
  end

  def show_faq
    @categories = Spree::QuestionCategory.all
    respond_with(@categories) do |format|
      format.html { render :faq }
    end
  end

  def show_user_questions
  end


  def update_user_question
    if @user.update_attributes(user_params)
      if params[:user][:password].present?
        user = Spree::User.reset_password_by_token(params[:user])
      end
    end
    redirect_to spree.account_url, notice: Spree.t(:account_updated)
  end

  def create_user_question
    @user_question = Spree::UserQuestion.new(user_question_params.merge({user_id: try_spree_current_user.try(:id)}))
      #if Spree::UserQuestion::Config.contact_tracking_message.present?
      #  flash[:contact_tracking] = Spree::ContactUs::Config.contact_tracking_message
      #end
      #redirect_to(spree.root_path, :notice => Spree.t('contact_us.notices.success'))
    respond_to do |format|
      if @user_question.save
        format.js { render js: 'contactComplete();' }
      else
        #format.html { render layout: !request.xhr? }
        format.js { render js: 'contactError();' }
        #format.json { render layout: false }
      end
    end
  end

  def new_user_question
    @user_question ||= Spree::UserQuestion.new
    #@contact = Spree::ContactUs::Contact.new
    #@taxonomies = Spree::Taxonomy.includes(root: :children)

#      invoke_callbacks(:new_action, :before)
    respond_with(@user_question) do |format|
      format.html { render layout: !request.xhr? }
      #if request.xhr?
        #@user_question.save if @user_question.valid?
        #format.json { render json: populate_json.to_json }
        #format.json { render layout: false }
      #end
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
    end
    redirect_to spree.account_url, notice: Spree.t(:account_updated)
  end


  #def default_title
  #  Spree.t(:help)
  #end


  private

  def safe_user_question_params
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
    params.require(:user_question).permit(*safe_user_question_params)
  end

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

  #def to_param
  #  "#{id}-#{title.parameterize}"
  #end

  def accurate_title
    Spree.t(:help)# + "#{title.parameterize}"
  end
end
