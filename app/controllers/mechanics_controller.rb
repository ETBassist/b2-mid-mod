class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    mechanic.rides << Ride.find(params[:ride_id])
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
