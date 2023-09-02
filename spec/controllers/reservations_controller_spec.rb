require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  let(:hotel) { create(:hotel) }

  describe "POST #create" do
    it "creates a new reservation" do
      expect {
        post :create, params: {
          reservation: attributes_for(:reservation, hotel_id: hotel.id)
        }
      }.to change(Reservation, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it "returns an error for invalid reservation" do
      post :create, params: {
        reservation: attributes_for(:reservation, hotel_id: nil)
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      reservation = create(:reservation, hotel_id: hotel.id)
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT #update" do
    it "updates a reservation" do
      reservation = create(:reservation, hotel_id: hotel.id)
      put :update, params: {
        id: reservation.id,
        reservation: { guest_name: "Updated Name" }
      }
      expect(response).to have_http_status(:ok)
      expect(reservation.reload.guest_name).to eq("Updated Name")
    end

    it "returns an error for invalid update" do
      reservation = create(:reservation, hotel_id: hotel.id)
      put :update, params: {
        id: reservation.id,
        reservation: { hotel_id: nil }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a reservation" do
      reservation = create(:reservation, hotel_id: hotel.id)
      expect {
        delete :destroy, params: { id: reservation.id }
      }.to change(Reservation, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
