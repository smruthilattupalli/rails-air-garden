class DashboardController < ApplicationController
  def index
    @bookings = current_user.bookings
    @gardens = current_user.gardens
  end
end
