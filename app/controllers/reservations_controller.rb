# frozen_string_literal: true

class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html
      format.json { render json: @reservations }
    end
  end

  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @reservation }
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    # byebug
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reserva atualizada com sucesso.' }
        format.json { render json: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reserva excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:hotel_id, :price, :currency, :check_in, :check_out, :guest_name, :guest_email)
  end
end
