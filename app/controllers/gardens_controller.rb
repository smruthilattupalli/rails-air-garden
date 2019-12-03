class GardensController < ApplicationController

  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = @garden = Garden.new(set_garden_params)
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
                            :capacity, :size)
  end
end
