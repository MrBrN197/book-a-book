class Api::ReservationsController < ApplicationController
  def index
    reservations = current_user.reservations.includes(:book)
    render json: reservations, except: [:created_at, :updated_at]
  end

  def show
    reservation = current_user.reservations.find(params[:id])
    render json: reservation, except: [:created_at, :updated_at]
  end
end