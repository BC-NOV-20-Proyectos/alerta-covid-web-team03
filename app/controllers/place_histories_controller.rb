class PlaceHistoriesController < ApplicationController
  before_action :set_place_history, only: %i[ show edit update destroy ]

  # GET /place_histories or /place_histories.json
  def index
    @place_histories = PlaceHistory.all
  end

  # GET /place_histories/1 or /place_histories/1.json
  def show
  end

  # GET /place_histories/new
  def new
    @place_history = PlaceHistory.new
  end

  # GET /place_histories/1/edit
  def edit
  end

  # POST /place_histories or /place_histories.json
  def create
    @place_history = PlaceHistory.new(place_history_params)

    respond_to do |format|
      if @place_history.save
        format.html { redirect_to @place_history, notice: "Place history was successfully created." }
        format.json { render :show, status: :created, location: @place_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place_histories/1 or /place_histories/1.json
  def update
    respond_to do |format|
      if @place_history.update(place_history_params)
        format.html { redirect_to @place_history, notice: "Place history was successfully updated." }
        format.json { render :show, status: :ok, location: @place_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_histories/1 or /place_histories/1.json
  def destroy
    @place_history.destroy
    respond_to do |format|
      format.html { redirect_to place_histories_url, notice: "Place history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_history
      @place_history = PlaceHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_history_params
      params.require(:place_history).permit(:date, :user_id, :place_id)
    end
end
