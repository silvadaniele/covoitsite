class Rides::RequestsController < ApplicationController
  def create
    @ride = Ride.find params[:ride_id]

    @request = current_user.requests.new(request_params)
    @request.ride_id = @ride.id

    if @request.save
      ApplicationMailer.new_request(@request.id).deliver_now
      redirect_to root_path, notice: "Your request was successfully sent!"
    else
      redirect_to root_path, notice: "There was a problem! #{@request.errors.full_messages}"
    end
  end

  private

  def request_params
    params.require(:request).permit(:number_of_passengers, :original_message)
  end
end
