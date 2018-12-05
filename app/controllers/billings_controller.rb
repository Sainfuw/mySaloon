class BillingsController < ApplicationController
  before_action :set_billing, only: [:show, :edit, :update, :destroy]

  # GET /billings
  # GET /billings.json
  def index
    if params[:searchBar].present?
      @billings  = Billing.where('amount = ?', params[:searchBar])
    else
      @billings = Billing.all
    end
  end

  # GET /billings/1
  # GET /billings/1.json
  def show
  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings
  # POST /billings.json
  def create
    @billing = Billing.new(billing_params)
    @booking = Booking.find(params[:billing][:booking_id])
    respond_to do |format|
      if @billing.save
        if @booking.present?
          BookingService.where(booking: @booking).each do |bs|
            bs.billing = @billing
            bs.save
          end
        end
        format.html { redirect_to bookings_url, info: 'Factura creada satisfactoriamente...' }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, info: 'Factura modificada satisfactoriamente...' }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to billings_url, info: 'Factura eliminada satisfactoriamente.' }
      format.json { head :no_content }
      format.js { flash.now[:info] = 'Factura eliminada satisfactoriamente...' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.require(:billing).permit(:code, :payment_method, :amount, :currency, :comment, :customer_id)
    end
end
