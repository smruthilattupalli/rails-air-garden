class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @booking = Booking.new(set_booking_params)
    @booking.user = current_user
    @garden = Garden.find(params[:garden_id])
    @booking.garden = @garden
    @booking.total_price = compute_price(@booking)

    if @booking.save
      redirect_to dashboards_path
      else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 'Accepted'
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = 'Rejected'
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def compute_price(booking)
    number_of_days = booking.end_date - booking.start_date
    number_of_days * booking.garden.price
  end

  def set_booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
