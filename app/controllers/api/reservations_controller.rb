class Api::ReservationsController < ApplicationController
  def index
    reservations = retrieve_user.reservations
    data_response(reservations, 'List of all reservations')
  end

  def show
    reservation = retrieve_user
    data_response(reservation, "Data for reservation #{params[:id]}")
  end

  def create
    new_reservation = retrieve_user.reservations.new(reservation_params)
    if new_reservation.save
      data_response(new_reservation, 'Reservation Created')
    else
      render json: {errors: new_reservation.errors, message: 'Operation failed'}, status: :bad_request, 
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
      render json: {reservation.errors, message: 'Operation failed'}, status: :bad_request, 
    end
  end

  private

  def reservation_params
    params.permit(:reservation_date, :city, :user_id, :book_id)
  end

  def data_response(data, message)
    render json: {data: data, message: message}, except: [:created_at, :updated_at]
  end

  def retrieve_user
    User.find(params[:user_id])
  end
end