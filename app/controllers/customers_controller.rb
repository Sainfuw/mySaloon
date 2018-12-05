class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :check_boxes, only: [:new, :edit]
  load_and_authorize_resource

  # GET /customers
  # GET /customers.json
  def index
    if params[:searchBar].present?
      @customers = Customer.where("name like ?", "%#{params[:searchBar]}%")
    else
      @customers = Customer.all
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.author = current_user

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_url, info: 'Cliente creado satisfactoriamente...' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_url, info: 'Cliente modificado satisfactoriamente...' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, success: 'Cliente eliminado correctamente...' }
      format.json { head :no_content }
      format.js { flash.now[:info] = 'Cliente eliminado correctamente...' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def check_boxes
      @status = [["Deshabilitado", "disabled"], ["Habilitado", "enabled"]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :address, :status, :author_id)
    end
end
