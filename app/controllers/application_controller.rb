class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: :format_json?

  private

  def format_json?
    request.format.json?
  end
end
