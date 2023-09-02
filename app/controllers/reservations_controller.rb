# frozen_string_literal: true

class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    head :no_content
  end

  private

  def reservation_params
    params.require(:reservation).permit(:hotel_id, :price, :currency, :check_in, :check_out, :guest_name, :guest_email)
  end
end
