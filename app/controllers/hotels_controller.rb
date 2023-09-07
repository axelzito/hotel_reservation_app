# frozen_string_literal: true

class HotelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hotel, only: %i[show edit update destroy]

  def index
    @hotels = Hotel.all

    respond_to do |format|
      format.html
      format.json { render json: @hotels }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @hotel }
    end
  end

  def new
    @hotel = Hotel.new
  end

  def edit; end

  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render json: @hotel, status: :created }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render json: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :stars, :price_range, :phone, :email, :description)
  end
end
