class Api::ApplicationController < ActionController::Base
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  before_action :validate_x_key_inflection

  protected

  def respond_with_errors(record)
    h = {
      message: 'Validation Failed',
      errors: record.errors
    }

    render json: h, status: :unprocessable_entity
  end

  private

  def record_not_found
    render json: { message: 'Not Found' }, status: :not_found
  end

  def parameter_missing
    render json: { message: 'Bad Request' }, status: :bad_request
  end

  def validate_x_key_inflection
    unless request.headers['X-Key-Inflection'] == 'camel'
      render json: { message: 'X-Key-Inflection header should be eq to camel' },
             status: :bad_request
    end
  end
end
