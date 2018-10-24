class BookingServiceController < ApplicationController
  def index
    @bookingService = BookingService.all
  end

  def new
    @bookingService = BookingService.new
  end

  def create
    @bookingService = BookingService.new(bookingService_params)

    respond_to do |format|
      if @bookingService.save
        format.html { redirect_to @bookingService, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @bookingService }
      else
        format.html { render :new }
        format.json { render json: @bookingService.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def bookingService_params
      params.require(:BookingService).permit(:code, :payment_method, :amount, :currency)
    end
end
