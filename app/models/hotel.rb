# frozen_string_literal: true

class Hotel
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :address, type: String
  field :stars, type: String
  field :price_range, type: String
  field :phone, type: String
  field :email, type: String
  field :description, type: String

  has_many :reservations, class_name: 'Reservation', dependent: :restrict_with_exception
end
