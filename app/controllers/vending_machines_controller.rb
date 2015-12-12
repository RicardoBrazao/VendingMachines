class VendingMachinesController < ApplicationController
  before_action :set_vending_machine, only: [:show, :edit, :update, :destroy]

  # GET /vending_machines
  # GET /vending_machines.json
  def index
    @vending_machines = VendingMachine.all.order(id: :asc)
  end

  # GET /vending_machines/1
  # GET /vending_machines/1.json
  def show
  end

  # GET /vending_machines/new
  def new
    @vending_machine = VendingMachine.new
  end

  # GET /vending_machines/1/edit
  def edit
    if params[:item_id].present?
      @item = @vending_machine.items.where(id: params[:item_id]).first
    end
      render partial: 'edit'
  end

  # POST /vending_machines
  # POST /vending_machines.json
  def create
    @vending_machine = VendingMachine.new(vending_machine_params)

    respond_to do |format|
      if @vending_machine.save
        format.html { redirect_to @vending_machine, notice: 'Vending machine was successfully created.' }
        format.json { render :show, status: :created, location: @vending_machine }
      else
        format.html { render :new }
        format.json { render json: @vending_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vending_machines/1
  # PATCH/PUT /vending_machines/1.json
  def update
    if vending_machine_params["change"]
      @context = VendingMachines::Update::Refill::Base.perform({params: params})
    else
      @context = VendingMachines::Update::GetItem::Base.perform({params: params})
    end

    respond_to do |format|
      # if @vending_machine.update(vending_machine_params)
      if @context.success?
        format.html { redirect_to @vending_machine, notice: 'Vending machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @vending_machine }
        format.js { render :update }
      else
        if !vending_machine_params['change']
          @item = @vending_machine.items.where(id: vending_machine_params['items_attributes']['0']['id']).first
        end
        format.html { render partial: 'edit' }
        format.js { render :edit }
        format.json { render json: @vending_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vending_machines/1
  # DELETE /vending_machines/1.json
  def destroy
    @vending_machine.destroy
    respond_to do |format|
      format.html { redirect_to vending_machines_url, notice: 'Vending machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vending_machine
      @vending_machine = VendingMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vending_machine_params
      params.require(:vending_machine).permit(:change => ["0.01","0.02","0.05","0.10","0.20","0.50","1.00","2.00"], :items_attributes => [:id, :quantity])
    end
end
