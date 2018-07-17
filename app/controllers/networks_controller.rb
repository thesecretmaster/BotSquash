class NetworksController < ApplicationController
  before_action :set_network, only: %i[show edit update destroy]

  # GET /networks
  # GET /networks.json
  def index
    @networks = Network.all
  end

  # GET /networks/1
  # GET /networks/1.json
  def show; end

  # GET /networks/new
  def new
    @network = Network.new
  end

  # GET /networks/1/edit
  def edit; end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to @network, notice: 'Network was successfully created.' }
        format.json { render :show, status: :created, location: @network }
      else
        format.html { render :new }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to @network, notice: 'Network was successfully updated.' }
        format.json { render :show, status: :ok, location: @network }
      else
        format.html { render :edit }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_network_to_bot
    @bot = Bot.find(params[:bot][:id])
    @network = if params[:network][:id].present?
                 Network.find(params[:network][:id])
               else
                 Network.create(name: params[:network][:name])
               end
    @bot.networks << @network
    respond_to do |format|
      format.json { render :show, status: :ok, location: @network }
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network.destroy
    respond_to do |format|
      format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def query
    @networks = Network.where('name LIKE ?', "%#{params[:term]}%")
    render json: { results: @networks }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_network
    @network = Network.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def network_params
    params.require(:network).permit(:name)
  end
end
