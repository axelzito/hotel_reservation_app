# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html
      format.json { render json: @reservations }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @reservation }
    end
  end

  def new
    @reservation = Reservation.new
  end

  def edit; end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: t('reservations.create_success') }
        format.json { render json: @reservation, status: :created }
      else
        format.html { render :new, flash: { error: t('reservations.create_error') } }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: t('reservations.update_success') }
        format.json { render json: @reservation }
      else
        format.html { render :edit, flash: { error: t('reservations.update_error') } }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: t('reservations.delete_success') }
      format.json { head :no_content }
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:hotel_id, :price, :currency, :check_in, :check_out, :guest_name, :guest_email)
  end
end
