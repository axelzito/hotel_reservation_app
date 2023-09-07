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
  validates :price, presence: true, format: { with: /\A\d+(?:[,.]\d{2})?\z/ }
  validates :guest_email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validate :check_in_not_in_past
  validate :check_out_after_check_in

  private

  def check_in_not_in_past
    return unless check_in && check_in < Time.zone.today

    errors.add(:check_in, 'cannot be in the past')
  end

  def check_out_after_check_in
    return unless check_in && check_out && check_out <= check_in

    errors.add(:check_out, 'must be after the check-in date')
  end
end
