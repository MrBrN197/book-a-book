module Api
  class UsersController < ApplicationController
    def index
      render json: { users: User.all }
    end

    def show
      begin
        @user = User.find(id: params[:id])
        render json: { user: user }
      rescue => exception
        render json: { error: exception.message }
      end
    end
  end
end