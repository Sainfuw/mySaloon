class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_date, only: [:new, :create, :edit, :update]
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
    @booking = Booking.new()
    @booking = set_params(@booking, @date)
    @booking.author = current_user

    respond_to do |format|
      if @booking.save
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
    if params[:booking][:title].present? or params[:booking][:end].present?
      @booking = set_params(@booking, @date)
    else
      @booking.start = params[:booking][:start]
    end
    respond_to do |format|
      if @booking.save
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

    def set_date
      @date = params[:date]
    end

    def set_params(booking, date)
      booking.title = params[:booking][:title]
      booking.comment = params[:booking][:comment]
      if booking.new_record?
        date = date.to_date.change(day:date.to_date.day.to_i + 1)
      end
      booking.start = date.to_date.to_s + " " + params[:booking][:start]
      booking.end = date.to_date.to_s + " " + params[:booking][:end]
      booking.status = params[:booking][:status]
      booking.user_id = params[:booking][:user_id].present? ? params[:booking][:user_id] : booking.user_id
      booking.customer_id = params[:booking][:customer_id].present? ? params[:booking][:customer_id] : booking.customer_id
      booking
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:title, :comment, :start, :end, :status, :user_id, :customer_id)
    end
end
