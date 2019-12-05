class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @gardens = current_user.gardens
  end
end
