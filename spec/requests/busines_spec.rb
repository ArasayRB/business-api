require 'rails_helper'

RSpec.describe 'Busines API', type: :request do
  # add todos owner
  let(:user) { create(:user) }
  # initialize test data
  let!(:busines) { create_list(:busine, 10, owner: user.id) }
  let(:busine_id) { busines.first.id }
  #let (:name){"Ana"}
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /busines
  describe 'GET /busines' do
    # make HTTP get request before each example
    before { get '/busines', params: {}, headers: headers  }

    it 'returns busines' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /busines/:id
  describe 'GET /busines/:id' do
    before { get "/busines/#{busine_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the busine' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(busine_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:busine_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Busine/)
      end
    end
  end

  # Test suite for POST /busines
  describe 'POST /busines' do
    # valid payload
    let(:valid_attributes) do
      { name: 'Restaurant', owner: '1', mercantil_code: 'C98I893H7', address:'Julio Cuevas #54 e/ Rafael Bernal y Agustin Neto', description:'Restaurant de comida internacional y criolla' }.to_json
    end

    context 'when the request is valid' do
      before { post '/busines', params: valid_attributes, headers: headers }

      it 'creates a busine' do
        expect(json['name']).to eq('Restaurant')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil }.to_json }
      before { post '/busines', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: /)
      end
    end
  end

  # Test suite for PUT /busines/:id
  describe 'PUT /busines/:id' do
    let(:valid_attributes) { { name: 'Hostal' }.to_json }

    context 'when the record exists' do
      before { put "/busines/#{busine_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /busines/:id
  describe 'DELETE /busines/:id' do
    before { delete "/busines/#{busine_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
