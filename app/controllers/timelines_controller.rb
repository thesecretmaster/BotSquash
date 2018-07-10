class TimelinesController < ApplicationController
  before_action :set_action, only: %i[show edit update destroy]

  # GET /timelines
  # GET /timelines.json
  def index
    @timelines = Action.all.group(:bot_id)
  end

  # GET /timelines/1
  # GET /timelines/1.json
  def show; end

  # GET /timelines/new
  def new
    @action = Action.new
  end

  # GET /timelines/1/edit
  def edit; end

  # POST /timelines
  # POST /timelines.json
  def create
    @action = Action.new(action_params)

    respond_to do |format|
      if @action.save
        format.html { redirect_to @action, notice: 'Action was successfully created.' }
        format.json { render :show, status: :created, location: @action }
      else
        format.html { render :new }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timelines/1
  # PATCH/PUT /timelines/1.json
  def update
    respond_to do |format|
      if @action.update(action_params)
        format.html { redirect_to @action, notice: 'Action was successfully updated.' }
        format.json { render :show, status: :ok, location: @action }
      else
        format.html { render :edit }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timelines/1
  # DELETE /timelines/1.json
  def destroy
    @action.destroy
    respond_to do |format|
      format.html { redirect_to timelines_url, notice: 'Timeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_action
    @action = Action.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def action_params
    params.fetch(:action, {})
  end
end
