class RidesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_ride, only: [:show]

  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ride
    @ride = Ride.find(params[:id])
  end
end
