module Api
  class UsersController < ApplicationController
    def index
      render json: { users: User.all }, except: %i[created_at updated_at]
    end

    def show
      @user = User.find(params[:id])
      render json: { user: @user }, except: %i[created_at updated_at], status: :ok
    end

    def sign_up
      @user = User.create!(username: params[:username])
      render json: { user: @user }, status: :ok
    end

    def login
      @user = User.find_by(username: params[:username])
      if @user
        render json: { user: @user }, status: :ok
      else
        render json: { errors: [{ message: 'user doesn\'t exist' }] }, status: unprocessable_entity
      end
    end
  end
end
