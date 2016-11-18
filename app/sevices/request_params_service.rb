class RequestParamsService
  DIGGED_PARAMS = [
    %i(excavation_info digsite_info well_known_text)
  ]
  FIRST_LEVEL_PARAMS = %i(
    request_number sequence_number request_type
    excavator service_area request_action
  )

  attr_reader :normalized_params
  def initialize(params)
    @params = params
    @normalized_params = {}
    normalize_params
  end

  private

  def normalize_params
    @normalized_params.merge!(first_level_params)
    @normalized_params.merge!(digged_params)
  end

  def first_level_params
    FIRST_LEVEL_PARAMS.map do |attr_name|
      [attr_name, @params[attr_name]]
    end.to_h
  end

  def digged_params
    DIGGED_PARAMS.map do |way|
      [way.last, @params.dig(*way)]
    end.to_h
  end
end
