class GamePointsController < ApplicationController
  before_action :set_game_point, only: %i[ show edit update destroy ]

  # GET /game_points or /game_points.json
  def index
    @game_points = GamePoint.all
  end

  # GET /game_points/1 or /game_points/1.json
  def show
  end

  # GET /game_points/new
  def new
    @game_point = GamePoint.new
  end

  # GET /game_points/1/edit
  def edit
  end

  # POST /game_points or /game_points.json
  def create
    @game_point = GamePoint.new(game_point_params)
    @match = Match.find(params[:game_point][:match_id])

    respond_to do |format|
      if @game_point.save
        format.html { redirect_to match_url(@match), notice: "Game point was successfully created." }
        format.json { render :show, status: :created, location: @game_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_points/1 or /game_points/1.json
  def update
    respond_to do |format|
      if @game_point.update(game_point_params)
        format.html { redirect_to game_point_url(@game_point), notice: "Game point was successfully updated." }
        format.json { render :show, status: :ok, location: @game_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_points/1 or /game_points/1.json
  def destroy
    @game_point.destroy

    respond_to do |format|
      format.html { redirect_to game_points_url, notice: "Game point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_point
      @game_point = GamePoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_point_params
      params.require(:game_point).permit(:match_id, :game_set_id, :game_gem_id, :is_first_player_win)
    end
end
