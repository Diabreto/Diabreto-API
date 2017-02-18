class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: :format_json?
  acts_as_token_authentication_handler_for User
  before_action :user_is_logged_in

  private

  def format_json?
    request.format.json?
  end

  def user_is_authorized
    unless current_user.id.to_s == params[:id]
      @errors = [t(:user_not_authorized)]
      render :error, status: :unauthorized
    end
  end

  def user_is_logged_in
    unless current_user
      @errors = [t(:user_not_authenticated)]
      render :error, status: :unauthorized
    end
  end

end
