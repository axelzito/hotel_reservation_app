class HotelsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @hotels = Hotel.all
    render json: @hotels
  end

  def show
    @hotel = Hotel.find(params[:id])
    render json: @hotel
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      render json: @hotel, status: :created
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      render json: @hotel
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    head :no_content
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :stars, :price_range, :phone, :email, :description)
  end
end
