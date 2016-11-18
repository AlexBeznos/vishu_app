require 'rails_helper'

RSpec.describe Request, type: :model do

  it { is_expected.to validate_presence_of(:request_number) }
  it { is_expected.to validate_presence_of(:sequence_number) }
  it { is_expected.to validate_presence_of(:request_type) }
  it { is_expected.to validate_presence_of(:request_action) }
  it { is_expected.to validate_presence_of(:excavator) }
  it { is_expected.to validate_presence_of(:service_area) }
  it { is_expected.to validate_presence_of(:well_known_text) }

  it 'should have valid factory' do
    expect(build(:request)).to be_valid
  end
end
