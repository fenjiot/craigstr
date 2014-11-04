class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
    unless current_user.admin
      flash[:error] = "Admin?"
      redirect_to :root
    end
  end

end
