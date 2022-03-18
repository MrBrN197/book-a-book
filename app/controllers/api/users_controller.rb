require 'jwt'

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
      jwt_token = create_jwt({ user_id: @user.id, username: @user.username })
      render json: { user: @user, token: jwt_token }, status: :ok, except: %i[created_at updated_at]
    end

    def login
      return render json: { errors: [{ message: 'no username param provided' }] } unless params[:username]

      @user = User.find_by(username: params[:username])
      if @user
        jwt_token = create_jwt({ user_id: @user.id, username: @user.username })
        render json: { user: @user, token: jwt_token }, status: :ok, except: %i[created_at updated_at]
      else
        render json: { errors: [{ message: 'user doesn\'t exist' }] }, status: :not_found
      end
    end

    def token
      token = auth_token
      decoded_token, = JWT.decode token, nil, false
      decoded_token = HashWithIndifferentAccess.new decoded_token

      @user = User.find(decoded_token[:user_id])
      if @user
        render json: { user: @user }, status: :ok
      else
        render json: { errors: [{ message: 'user doesn\'t exist' }] }, status: :unprocessable_entity
      end
    end

    private

    def create_jwt(data)
      exp = Time.now.to_i + (4 * 3600)
      payload = { **data, exp: exp }
      JWT.encode payload, nil, 'none'
    end

    def auth_token
      header = request.headers['Authorization']
      raise(Exception.new, 'message') unless header =~ /Bearer /

      header.sub(/Bearer /, '')
    end
  end
end
