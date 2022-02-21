class Api::ReservationsController < ApplicationController
  def index
    reservations = retrieve_user.reservations
    data_response(reservations, 'List of all reservations')
  end

  def show
    reservation = retrieve_user
    reservation = retrieve_user.reservations.find(params[:id])
    data_response(reservation, "Data for reservation #{params[:id]}")
  end

  def create
    user = User.find(reservation_params[:user_id])
    date = DatTime.parse(reservation_params(:reservation_date))
    book = Book.find(reservation_params[:book_id])
    city = reservation_params(:city)
    print date
    new_reservation = user.reservations.new(reservation_date: date, city: city, book: book)
    if new_reservation.save
      data_response(new_reservation, 'Reservation Created')
    else
      render json: { errors: new_reservation.errors, message: 'Operation failed' }, status: :unprocessable_entity
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
      render json: { data: reservation.errors, message: 'Operation failed' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city, :user_id, :book_id)
  end

  def data_response(data, message)
    render json: { data: data, message: message }, except: %i[created_at updated_at]
  end

  def retrieve_user
    User.find(params[:user_id])
  end
end
