module Api
  class UsersController < ApplicationController
    def index
      render json: { users: User.all }
    end

    def show
      begin
        @user = User.find(id: params[:id])
        render json: { user: user }
      rescue => e
        render json: { error: { message: e.message } }
      end
    end
  end
end