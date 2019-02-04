class Account::RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  # GET /account/rides
  # GET /account/rides.json
  def index
    @rides = current_user.rides
  end

  # GET /account/rides/1
  # GET /account/rides/1.json
  def show
  end

  # GET /account/rides/new
  def new
    @ride = current_user.rides.new
  end

  # GET /account/rides/1/edit
  def edit
  end

  # POST /account/rides
  # POST /account/rides.json
  def create
    @ride = current_user.rides.new(ride_params)

    respond_to do |format|
      if @ride.save
        format.html { redirect_to account_ride_path(@ride), notice: 'Ride was successfully created.' }
        format.json { render :show, status: :created, location: account_ride_path(@ride) }
      else
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/rides/1
  # PATCH/PUT /account/rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to account_ride_path(@ride), notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: account_ride_path(@ride) }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/rides/1
  # DELETE /account/rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to account_rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = current_user.rides.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:owner_id, :origin, :destination, :departure_at, :capacity, :price)
    end
end
