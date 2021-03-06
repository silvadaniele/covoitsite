class Rides::RequestsController < ApplicationController
  def create
    @ride = Ride.find params[:ride_id]

    @request = current_user.requests.new(request_params)
    @request.ride_id = @ride.id

    if @request.save
      ApplicationMailer.new_request(@request.id).deliver_now
      redirect_to root_path, notice: t(".success")
    else
      redirect_to root_path, alert: t(".error", error: @request.errors.full_messages.join(", "))
    end
  end

  private

  def request_params
    params.require(:request).permit(:number_of_passengers, :original_message)
  end
end
