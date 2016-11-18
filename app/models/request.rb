class Request < ActiveRecord::Base
  validates :request_number, :sequence_number, :request_type, :request_action,
            :service_area, :excavator, :well_known_text, presence: true
end
