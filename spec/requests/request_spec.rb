require 'rails_helper'

RSpec.describe Api::V1::RequestsController, type: :request do
  let(:api_path) {'/api/v1/requests'}
  let(:headers) do
    {
      "Content-Type" => "application/json",
      "X-Key-Inflection" => "camel"
    }
  end

  it 'should validate X-Key-Inflection header' do
    post api_path, {
      "ContactCenter": "UPCA",
      "RequestNumber": "09252012-00001"
    }

    expect(response.status).to eq 400
    expect(JSON.parse(response.body)).to eq({
      "message" => 'X-Key-Inflection header should be eq to camel'
    })
  end

  describe '#create' do
    let(:data_path) { File.join(Rails.root, 'spec', 'fixtures', data_file_name) }
    let(:data) { File.open(data_path).read }
    before { post api_path, data, headers }

    describe 'with correct data' do
      let(:data_file_name) { 'correct_request.json' }

      it 'should respond with status 200' do
        expect(response.status).to eq 200
      end

      it 'should response with request body' do
        expect(JSON.parse(response.body).keys).to include "request"
      end
    end

    describe 'with incorrect data' do
      let(:data_file_name) { 'incorrect_request.json' }

      it 'should respond with status 422' do
        expect(response.status).to eq 422
      end

      it 'should response with request body' do
        expect(JSON.parse(response.body).keys).to include "errors"
      end
    end
  end
end
