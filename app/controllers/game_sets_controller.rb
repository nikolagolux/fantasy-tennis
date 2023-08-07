class GameSetsController < ApplicationController
  before_action :set_game_set, only: %i[ show edit update destroy ]

  # GET /game_sets or /game_sets.json
  def index
    @game_sets = GameSet.all
  end

  # GET /game_sets/1 or /game_sets/1.json
  def show
  end

  # GET /game_sets/new
  def new
    @game_set = GameSet.new
  end

  # GET /game_sets/1/edit
  def edit
  end

  # POST /game_sets or /game_sets.json
  def create
    @game_set = GameSet.new(game_set_params)

    respond_to do |format|
      if @game_set.save
        format.html { redirect_to game_set_url(@game_set), notice: "Game set was successfully created." }
        format.json { render :show, status: :created, location: @game_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_sets/1 or /game_sets/1.json
  def update
    respond_to do |format|
      if @game_set.update(game_set_params)
        format.html { redirect_to game_set_url(@game_set), notice: "Game set was successfully updated." }
        format.json { render :show, status: :ok, location: @game_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sets/1 or /game_sets/1.json
  def destroy
    @game_set.destroy

    respond_to do |format|
      format.html { redirect_to game_sets_url, notice: "Game set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_set
      @game_set = GameSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_set_params
      params.require(:game_set).permit(:match_id, :is_first_player_win, :first_player_gems, :second_player_gems)
    end
end
