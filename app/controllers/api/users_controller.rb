module Api
  class UsersController < ApplicationController
    def index
      render json: { users: User.all }
    end

    def show
      @user = User.find(params[:id])
      render json: { user: @user }
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: { message: e.message } }
    end
  end
end
