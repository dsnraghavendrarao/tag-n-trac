class ShipmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shipment, only: %i[ show edit update destroy ]
  before_action :address_types

  def index
    if current_user.role == "Partner"
      @shipments = Shipment.includes(:user, :addresses).where(partner_id: current_user.id).order(created_at: :desc).page(params[:page])
    elsif current_user.role == "Customer"
      @shipments = Shipment.includes(:user, :addresses).where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
    else
      @shipments = Shipment.includes(:user, :addresses).order(created_at: :desc).page(params[:page])
    end
  end

  def show
  end

  def new
    @shipment = Shipment.new
    2.times do |i|
      @shipment.addresses.build(source: @address_types[i])
    end
  end

  def edit
  end

  def create
    @shipment = Shipment.new(shipment_params)
    @shipment.user_id = current_user.id 
    respond_to do |format|
      if @shipment.save
        format.html { redirect_to shipments_path, notice: "Shipment was successfully created." }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to shipments_url(@shipment), notice: "Shipment was successfully updated." }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shipment.destroy!

    respond_to do |format|
      format.html { redirect_to shipments_url, notice: "Shipment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    def address_types
      @address_types = ["From", "To"]
    end

    def shipment_params
      params.require(:shipment).permit(:user_id, :name, :partner_id, :status, :description, addresses_attributes: [:id, :name, :address, :land_mark, :pincode, :city,:state, :phone, :source, :active])
    end

    # def check_current_user
    #   redirect_to roots_path
    # end
end

