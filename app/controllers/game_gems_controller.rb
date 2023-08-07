class GameGemsController < ApplicationController
  before_action :set_game_gem, only: %i[ show edit update destroy ]

  # GET /game_gems or /game_gems.json
  def index
    @game_gems = GameGem.all
  end

  # GET /game_gems/1 or /game_gems/1.json
  def show
  end

  # GET /game_gems/new
  def new
    @game_gem = GameGem.new
  end

  # GET /game_gems/1/edit
  def edit
  end

  # POST /game_gems or /game_gems.json
  def create
    @game_gem = GameGem.new(game_gem_params)

    respond_to do |format|
      if @game_gem.save
        format.html { redirect_to game_gem_url(@game_gem), notice: "Game gem was successfully created." }
        format.json { render :show, status: :created, location: @game_gem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_gem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_gems/1 or /game_gems/1.json
  def update
    respond_to do |format|
      if @game_gem.update(game_gem_params)
        format.html { redirect_to game_gem_url(@game_gem), notice: "Game gem was successfully updated." }
        format.json { render :show, status: :ok, location: @game_gem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_gem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_gems/1 or /game_gems/1.json
  def destroy
    @game_gem.destroy

    respond_to do |format|
      format.html { redirect_to game_gems_url, notice: "Game gem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_gem
      @game_gem = GameGem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_gem_params
      params.require(:game_gem).permit(:game_set_id, :match_id, :is_first_player_win, :first_player_points, :second_player_points, :is_first_player_serve)
    end
end
