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
end
