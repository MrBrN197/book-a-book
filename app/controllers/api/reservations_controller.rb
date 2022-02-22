class Api::ReservationsController < ApplicationController
  def index
    reservations = retrieve_user.reservations
    data_response(reservations, 'List of all reservations')
  end

  def show
    if current_reservation
      data_response(current_reservation, "Data for reservation #{params[:id]}")
    else
      render json: { errors: current_reservation.errors, message: 'Object not found' }, status: :unprocessable_entity
    end
  end

  def create
    date = DateTime.parse(reservation_params[:reservation_date])
    book = Book.find(reservation_params[:book_id])
    city = reservation_params[:city]
    new_reservation = retrieve_user.reservations.new(reservation_date: date, city: city, book: book)
    if new_reservation.save
      data_response(new_reservation, 'Reservation Created')
    else
      render json: { errors: new_reservation.errors, message: 'Operation failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = current_reservation
    current_reservation.destroy
    data_response(reservation, 'Reservation Deleted')
  end

  def update
    date = DateTime.parse(reservation_params[:reservation_date])
    book = Book.find(reservation_params[:book_id])
    city = reservation_params[:city]
    if current_reservation.update(reservation_date: date, city: city, book: book)
      data_response(current_reservation, 'Reservation Updated')
    else
      render json: { data: current_reservation.errors, message: 'Operation failed' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.permit(:reservation_date, :city, :book_id)
  end

  def data_response(data, message)
    render json: { data: data, message: message }, except: %i[created_at updated_at]
  end

  def retrieve_user
    User.find(params[:user_id])
  end

  def current_reservation
    retrieve_user.reservations.find(params[:id])
  end
end
