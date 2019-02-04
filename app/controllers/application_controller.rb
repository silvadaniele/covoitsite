class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  unless Rails.application.config.consider_all_requests_local
    rescue_from(Exception, with: :render_500)
    rescue_from(ActionController::RoutingError, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: :render_404)
  end

  protected

  def render_500(exception)
    respond_to do |format|
      format.html { render 'errors/exception', status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end

  def render_404
    respond_to do |format|
      format.html { render 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
