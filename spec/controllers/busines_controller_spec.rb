require 'rails_helper'

RSpec.describe BusinesController, type: :controller do
  include ::RequestSpecHelper
  # initialize test data
 let!(:busines) { create_list(:busine, 10) }
 let(:busine_id) { busines.first.id }

 # Test suite for GET /busines
 describe 'GET /busines' do
   # make HTTP get request before each example
   before { get 'index' }

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

   context 'when the record exists' do
     before { get "show", params: {id:1} }
     it 'returns the busine' do
       expect(json).not_to be_empty
       expect(json['id']).to eq(busine_id)
     end

     it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
   end

   context 'when the record does not exist' do
     before { get "show", params: {id:100} }

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
   let(:valid_attributes) { { name: 'Learn Elm', owner: 'Alejo Carpentier', mercantil_code: 'AD89T65' } }

   context 'when the request is valid' do
     before { post 'create', params: valid_attributes }

     it 'creates a busine' do
       expect(json['name']).to eq('Learn Elm')
     end

     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end
   end

   context 'when the request is invalid' do
     before { post 'create', params: { name: 'Foobar' } }

     it 'returns status code 422' do
       expect(response).to have_http_status(422)
     end

     it 'returns a validation failure message' do
       expect(response.body).to match(/Validation failed:/)
     end
   end
 end

 # Test suite for PUT /busines/:id
 describe 'PUT /busines/:id' do
   let(:valid_attributes) { { name: 'Shopping', id:1 } }

   context 'when the record exists' do
     before { put "update", params: valid_attributes }

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
   let(:valid_attributes) { { id:1 } }
   before { delete "destroy", params: valid_attributes }

   it 'returns status code 204' do
     expect(response).to have_http_status(204)
   end
 end
end
