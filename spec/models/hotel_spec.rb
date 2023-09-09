# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hotel, type: :model do
  let(:hotel) { build(:hotel) }

  it 'is valid with valid attributes' do
    expect(hotel).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:stars) }
    it { should validate_presence_of(:price_range) }
    it { should validate_presence_of(:phone) }

    it 'validates the format of email' do
      hotel.email = 'invalid_email'
      expect(hotel).not_to be_valid
      expect(hotel.errors[:email]).to include(I18n.t('mongoid.errors.models.hotel.attributes.email.invalid'))
    end

    it 'allows valid email format' do
      hotel.email = 'valid_email@example.com'
      expect(hotel).to be_valid
    end
  end
end
