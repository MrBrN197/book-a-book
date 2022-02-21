class Api::ReservationsController < ApplicationController
  def index
    reservations = current_user.reservations.includes(:book)
    render json: reservations, message: 'List of all reservations', except: [:created_at, :updated_at]
  end

  def show
    reservation = current_user.reservations.find(params[:id])
    render json: reservation, message: "Data for reservation #{params[:id]}", except: [:created_at, :updated_at]
  end

  def create
    new_reservation = current_user.reservations.new(reservation_params)
    if new_reservation.save
      render json: new_reservation, message: 'Reservation Created', except: [:created_at, :updated_at]
    else
      render json: new_reservation.errors, status: :bad_request, message: 'Operation failed'
    end
  end

  def destroy
    reservation = current_user.reservations.find(params[:id])
    reservation.destroy
    render json: reservation, message: 'Reservation Deleted', except: [:created_at, :updated_at]
  end

  private

  def reservation_params
    params.permit(:reservation_date, :city, :user_id, :book_id)
  end
end