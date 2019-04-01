class WebhooksController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render json: params.to_json, status: 200
  end

  def create
    render json: params.to_json, status: 200
  end
end