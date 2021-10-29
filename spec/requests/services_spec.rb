require 'rails_helper'

RSpec.describe 'Services API' do
  let(:user) { create(:user) }
  # Initialize the test data
  let!(:busine) { create(:busine, owner: user.id) }
  let!(:services) { create_list(:service, 20, busine_id: busine.id) }
  let(:busine_id) { busine.id }
  let(:id) { services.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /busines/:busine_id/services
  describe 'GET /busines/:busine_id/services' do
    before { get "/busines/#{busine_id}/services", params: {}, headers: headers }

    context 'when busine exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all busine services' do
        expect(json.size).to eq(20)
      end
    end

    context 'when busine does not exist' do
      let(:busine_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Busine/)
      end
    end
  end

  # Test suite for GET /busines/:busine_id/services/:id
  describe 'GET /busines/:busine_id/services/:id' do
    before { get "/busines/#{busine_id}/services/#{id}", params: {}, headers: headers }

    context 'when busine service exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the service' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when busine service does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Service/)
      end
    end
  end

  # Test suite for PUT /busines/:busine_id/services
  describe 'POST /busines/:busine_id/services' do
    let(:valid_attributes) { { title: 'Monta a Caballo', aproximate_price: 23.8, description:'Paseo a caballo con guía incluido a cascada trinitaria', top_people: 2, min_people: 4 }.to_json }

    context 'when request attributes are valid' do
      before { post "/busines/#{busine_id}/services", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/busines/#{busine_id}/services", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed:/)
      end
    end
  end

  # Test suite for PUT /busines/:busine_id/services/:id
  describe 'PUT /busines/:busine_id/services/:id' do
    let(:valid_attributes) { { title: 'Mozart' }.to_json }

    before { put "/busines/#{busine_id}/services/#{id}", params: valid_attributes, headers: headers }

    context 'when service exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the service' do
        updated_service = Service.find(id)
        expect(updated_service.title).to match(/Mozart/)
      end
    end

    context 'when the service does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Service/)
      end
    end
  end

  # Test suite for DELETE /busines/:id
  describe 'DELETE /busines/:id' do
    before { delete "/busines/#{busine_id}/services/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
