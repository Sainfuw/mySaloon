class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :combo_boxes, only: [:new, :edit]
  load_and_authorize_resource

  # GET /services
  # GET /services.json
  def index
    if params[:searchBar].present?
      @services = Service.where("name like ?", "%#{params[:searchBar]}%")
    else
      @services = Service.all
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.author = current_user

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_url, info: 'Servicio creado correctamente...' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_url, info: 'Servicio modificado satisfactoriamente...' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, info: 'Servicio eliminado satisfactoriamente...' }
      format.json { head :no_content }
      format.js { flash.now[:info] = 'Servicio eliminado satisfactoriamente...' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def combo_boxes
      @status = [["Deshabilitado", "disabled"], ["Habilitado", "enabled"]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :price, :status, :author_id)
    end
end
