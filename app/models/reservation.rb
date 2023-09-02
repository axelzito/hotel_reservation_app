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
end
