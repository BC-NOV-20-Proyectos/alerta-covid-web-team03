# Area history controller web
class AreaHistoriesController < ApplicationController
  before_action :set_area_history, only: %i[ show edit update destroy ]

  # GET /area_histories or /area_histories.json
  def index
    @area_histories = AreaHistory.all
  end

  # GET /area_histories/1 or /area_histories/1.json
  def show
  end

  # GET /area_histories/new
  def new
    @area_history = AreaHistory.new
  end

  # GET /area_histories/1/edit
  def edit
  end

  # POST /area_histories or /area_histories.json
  def create
    @area_history = AreaHistory.new(area_history_params)

    respond_to do |format|
      if @area_history.save
        respond_if_is_true_web(@area_history, 'Area history was successfully created.', :show, :created, @area_history)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @area_history.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /area_histories/1 or /area_histories/1.json
  def update
    respond_to do |format|
      if @area_history.update(area_history_params)
        respond_if_is_true_web(@area_history, 'Area history was successfully updated.', :show, :ok, @area_history)
      else
        respond_if_is_false_web(:edit, :unprocessable_entity, @area_history.errors, :unprocessable_entity)
        
      end
    end
  end

  # DELETE /area_histories/1 or /area_histories/1.json
  def destroy
    @area_history.destroy
    respond_to do |format|
      format.html { redirect_to area_histories_url, notice: "Area history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_history
      @area_history = AreaHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_history_params
      params.require(:area_history).permit(:date, :user_id)
    end
end
