# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) { build(:reservation) }

  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end

  it 'is not valid without a hotel_id' do
    reservation.hotel = nil
    expect(reservation).not_to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:guest_name) }
    it { should validate_presence_of(:guest_email) }
    it { should validate_presence_of(:check_in) }
    it { should validate_presence_of(:check_out) }

    it 'allows valid email format' do
      reservation.guest_email = 'valid_email@example.com'
      expect(reservation).to be_valid
    end

    it 'validates the format of email' do
      reservation.guest_email = 'invalid_email'
      expect(reservation).not_to be_valid
      expect(reservation.errors[:guest_email]).to include('is invalid')
    end
  end
end
