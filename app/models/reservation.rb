# frozen_string_literal: true

class Reservation
  include Mongoid::Document
  include Mongoid::Timestamps
  field :price, type: String
  field :currency, type: String
  field :check_in, type: Date
  field :check_out, type: Date
  field :guest_name, type: String
  field :guest_email, type: String

  belongs_to :hotel, class_name: 'Hotel'

  validates :currency, :check_in, :check_out, :guest_name, presence: true
  validates :price, presence: true, format: { with: /\A\d{1,6}(\.\d{0,2})?\z/ }
  validates :guest_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
