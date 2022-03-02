class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: { data: @books }
  end

  def show
    @book = Book.find(params[:id])
    render json: { data: @book }, status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: { data: @book }, status: :created
    else
      render json: { errors: @book.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    render json: { data: @book, message: 'Book successfully deleted' }
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      render json: { data: @book }, status: :created
    else
      render json: { errors: @book.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :image, :description, :price, :rating, :genre)
  end
end
