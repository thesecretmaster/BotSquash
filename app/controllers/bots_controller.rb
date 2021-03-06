class BotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bot, only: %i[show edit update destroy add_hashtag add_network timeline timeline_modal]

  # GET /bots
  # GET /bots.json
  def index
    @bots = Bot.all.includes(:hashtags, :networks, :type).order('bot_types.severity DESC')
  end

  # GET /bots/1
  # GET /bots/1.json
  def show; end

  # GET /bots/new
  def new
    @bot = Bot.new
  end

  # GET /bots/1/edit
  def edit; end

  # POST /bots
  # POST /bots.json
  def create
    @bot = Bot.new(bot_params.merge(created_by: current_user))

    respond_to do |format|
      if @bot.save
        format.html { redirect_to @bot, notice: 'Bot was successfully created.' }
        format.json { render :show, status: :created, location: @bot }
      else
        format.html { render :new }
        format.json { render json: @bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bots/1
  # PATCH/PUT /bots/1.json
  def update
    respond_to do |format|
      new_status = Bot::Type.find(params[:bot][:type_id])
      if @bot.change_status(new_status, user: current_user, update_params: bot_params)
        format.html { redirect_to @bot, notice: 'Bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @bot }
      else
        format.html { render :edit }
        format.json { render json: @bot.errors, status: :unprocessable_entity }
      end
    end
  end

  def timeline
    @actions = @bot.actions.order(:created_at)
    respond_to do |format|
      format.html { render :timeline, status: :ok }
      format.json { render 'bots/_timeline.json.jbuilder', status: :ok }
    end
  end

  def timeline_modal
    @actions = @bot.actions.order(:created_at)
    render "bots/_timeline", layout: false
  end


  # DELETE /bots/1
  # DELETE /bots/1.json
  def destroy
    @bot.destroy
    respond_to do |format|
      format.html { redirect_to bots_url, notice: 'Bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bot
    @bot = Bot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bot_params
    params.fetch(:bot).permit(:username, :type_id, :notes)
  end
end
