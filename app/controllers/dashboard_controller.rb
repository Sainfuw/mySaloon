class DashboardController < ApplicationController

  def index
    @services_count = Service.actives.count
    @bookings_count = Booking.count
    @bookings_completed_count = Booking.where(status: 'completed').count
    @book_comp_prom = (@bookings_completed_count * 100) / @bookings_count
    @clients_count = Customer.count

    @services_prom = Service.eager_load(:bookings).map { |s| { id: s.id, percent: (s.bookings.size*100)/@bookings_count } }
    @top_services = @services_prom.group_by { |s| s[:percent] }.sort_by { |k, v| -k }.map(&:last).flatten.first(4)

    @bookings = Booking.last(5).reverse
  end

  def get_bookings_per_day
    @date = Date.today - 3
    @bookings_per_day = []
    7.times do
      @bookings_per_day << Booking.where(date: @date.beginning_of_day..@date.end_of_day).count
      @date += 1
    end
    render json: @bookings_per_day
  end
end
