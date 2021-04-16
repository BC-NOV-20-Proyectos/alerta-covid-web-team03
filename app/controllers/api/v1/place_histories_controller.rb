# Controller for Place History Api
class API::V1::PlaceHistoriesController <  API::V1::ApplicationAPIController
  load_and_authorize_resource
  before_action :set_place_history, only: %i[ show ]
  before_action :fill_parms, only: %i[ create ]
  
  # GET /place_histories or /place_histories.json
  def index
    @place_histories = PlaceHistory.all
  end

  # GET /place_histories/1 or /place_histories/1.json
  def show
  end

  # POST /place_histories or /place_histories.json
  def create
    if @place_history.save
      render json: to_json_serializer(@place_history), status: 201
    else
      render json: {errors: @place_history.errors},status: 422
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
