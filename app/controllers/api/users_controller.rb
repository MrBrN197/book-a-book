module Api
  class UsersController < ApplicationController
    def index
      render json: { users: User.all }
    end

    def show
      @user = User.find(params[:id])
      render json: { user: @user }, except: %i[created_at updated_at]
    end
  end
end
