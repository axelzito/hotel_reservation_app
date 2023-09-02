# frozen_string_literal: true

# spec/models/hotel_spec.rb

require 'rails_helper'

RSpec.describe Hotel, type: :model do
  let(:hotel) { build(:hotel) }

  it 'is valid with valid attributes' do
    expect(hotel).to be_valid
  end
end
