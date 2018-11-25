class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  # GET /bookings
  # GET /bookings.json
  def index
    if current_user.professional?
      @bookings = @bookings.where(user: current_user)
    else
      @bookings = Booking.all
    end
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.author = current_user
    @services_ids = params[:booking][:services]

    respond_to do |format|
      if @booking.save

        @services_ids.each do |service_id|
          if !service_id.empty?
            BookingService.create(booking: @booking, service_id: service_id)
          end
        end

        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
        format.js
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking.date = params[:booking][:date]
    @services_ids = params[:booking][:services]

    respond_to do |format|
      if @booking.update(booking_params)

        @booking.booking_services.destroy_all
        @services_ids.each do |service_id|
          if !service_id.empty?
            BookingService.create(booking: @booking, service_id: service_id)
          end
        end

        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:title, :comment, :date, :start, :end, :status, :user_id, :customer_id)
    end
end
