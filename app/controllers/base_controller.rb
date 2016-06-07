class BaseController < ActionController::Base

  before_action :authenticate_user!
  before_action :authorize_user

  layout 'application'

  rescue_from CanCan::AccessDenied, with: :unauthorized

  def unauthorized
    render 'home/unauthorized'
  end

  protected

  def action
    params[:action].to_sym
  end

  def authorize_user
    if respond_to?(:model_class, true) && model_class
      record = model_class
    else
      record = controller_name.to_sym
    end
    authorize! action, record
  end

end