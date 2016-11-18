# require 'support/geocoder.rb'

FactoryGirl.define do
  excavator_hash = {
    "company_name": "John Doe CONSTRUCTION",
    "address": "555 Some RD"
  }

  service_area_hash = {
		"primary_service_area_code": {
			"sa_code": "ZZGL103"
		},
		"additional_service_area_codes": {
			"sa_code": [
				"ZZL01",
				"ZZL02",
				"ZZL03"
			]
		}
  }

  factory :request do
    request_number { "09252012-00001" }
    sequence_number { "2421" }
    request_type { "Normal" }
    request_action { "Restake" }
    excavator { excavator_hash }
    service_area { service_area_hash }
    well_known_text { "POLYGON ((-9388407.6010849569 4046158.9036691156, -9388407.6010757331 4045598.9683762509, -9387944.1299591586 4045598.9683860973, -9387944.129966408 4046158.9036577442, -9388407.6010849569 4046158.9036691156))" }
  end
end
