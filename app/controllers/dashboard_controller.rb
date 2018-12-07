class DashboardController < ApplicationController

  def index
    if current_user.admin?
      @services_count = Service.actives.count
      @bookings_count = Booking.count
      @bookings_completed_count = Booking.where(status: 'completed').count
      @book_comp_prom = (@bookings_completed_count * 100) / @bookings_count
      @clients_count = Customer.count

      @services_prom = Service.eager_load(:bookings).map { |s| { id: s.id, percent: (s.bookings.size*100)/@bookings_count } }
      @top_services = @services_prom.group_by { |s| s[:percent] }.sort_by { |k, v| -k }.map(&:last).flatten.first(4)

      @bookings = Booking.last(5).reverse
    else
      redirect_to bookings_url
    end
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

  def get_billings_per_day
    @date = Date.today
    @billings_per_day = []
    6.times do |x|
      @sum = 0
      @billings = Billing.where(created_at: @date.beginning_of_day..@date.end_of_day)
      @billings.each do |billing|
        @sum += billing.amount
      end
      @date -= 1
      @billings_per_day << @sum
    end
    render json: @billings_per_day.reverse
  end
end
