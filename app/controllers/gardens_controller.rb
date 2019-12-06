class GardensController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @gardens = Garden.geocoded
    @markers = @gardens.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { garden: garden })
      }
    end
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(set_garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def set_garden_params
    params.require(:garden).permit(:title, :description, :price, :location,
                            :capacity, :size, :photo)
  end
end
