# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new hotel' do
      expect do
        post :create, format: :json, params: {
          hotel: attributes_for(:hotel)
        }
      end.to change(Hotel, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      hotel = create(:hotel)
      get :show, format: :json, params: { id: hotel.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    it 'updates a hotel' do
      hotel = create(:hotel)
      put :update, format: :json, params: {
        id: hotel.id,
        hotel: { description: 'Updated Description' }
      }
      expect(response).to have_http_status(:ok)
      expect(hotel.reload.description).to eq('Updated Description')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a hotel' do
      hotel = create(:hotel)
      expect do
        delete :destroy, format: :json, params: { id: hotel.id }
      end.to change(Hotel, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
