class Api::ReservationsController < ApplicationController
  def index
    reservations = current_user.reservations.includes(:book)
    data_response(reservations, 'List of all reservations')
  end

  def show
    reservation = retrieve_user
    data_response(reservation, "Data for reservation #{params[:id]}")
  end

  def create
    new_reservation = current_user.reservations.new(reservation_params)
    if new_reservation.save
      data_response(new_reservation, 'Reservation Created')
    else
      render json: new_reservation.errors, status: :bad_request, message: 'Operation failed'
    end
  end

  def destroy
    reservation = retrieve_user
    reservation.destroy
    data_response(reservation, 'Reservation Deleted')
  end

  def update
    reservation = retrieve_user
    if reservation.update(reservation_params)
      data_response(reservation, 'Reservation Updated')
    else
      render json: reservation.errors, status: :bad_request, message: 'Operation failed'
    end
  end

  private

  def reservation_params
    params.permit(:reservation_date, :city, :user_id, :book_id)
  end

  def data_response(data, message)
    render json: data, message: message, except: [:created_at, :updated_at] 
  end

  def retrieve_user
    current_user.reservations.find(params[:id])
  end
end