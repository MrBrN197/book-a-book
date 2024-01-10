class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_error_response

  def data_response(data, message)
    render json: { data: data, message: message }, except: %i[created_at updated_at]
  end

  def render_error_response(err)
    if err.is_a? Errors::StandardError
      render json: err, serializer: ErrorSerializer, status: e.status
    else
      render json: { errors: Array.wrap({ message: err.message, name: err.class.name }) }, status: 500
    end
  end
end
