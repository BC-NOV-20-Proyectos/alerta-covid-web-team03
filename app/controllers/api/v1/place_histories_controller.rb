class API::V1::PlaceHistoriesController <  API::V1::ApplicationAPIController
  load_and_authorize_resource
  before_action :set_place_history, only: %i[ show edit update destroy ]
  before_action :fill_parms, only: %i[ create ]
  
  

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
    if @place_history.save
      render json: to_json_serializer(@place_history), status: 201
    else
      render json: {errors: @place_history.errors},status: 422
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

    def fill_parms
      @place_history = PlaceHistory.new
      @place_history.user_id = current_user.id
      @place_history.date = Date.new
      @place_history.place_id = helpers.get_place(params[:place_history][:qr_code]).id
    end

    def to_json_serializer(obj)
      PlaceHistorySerializer.new(obj).serialized_json
    end
end
