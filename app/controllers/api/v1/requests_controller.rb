class Api::V1::RequestsController < Api::ApplicationController
  def create
    req = RequestParamsService.new(request_params)
    @request = Request.new(req.normalized_params)

    if @request.save
      respond_with(@request)
    else
      respond_with_errors(@request)
    end
  end

  private

  def request_params
    params.permit(
      :request_number, :sequence_number, :request_type, :request_action,
      excavator: [:company_name, :address],
      excavation_info: { digsite_info: [:well_known_text] },
      service_area: {
        primary_service_area_code: [:sa_code],
        additional_service_area_codes: {sa_code: []}
      }
    )
  end
end
