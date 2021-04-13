class API::V1::PlacesController <  API::V1::ApplicationAPIController
  load_and_authorize_resource
  before_action :set_place, only: %i[ show edit update destroy ]
  # GET /places or /places.json
  def index
    @places = Place.all.page(params[:page]).per(4)
    render json: PlaceSerializer.new(@places).serialized_json
  end

  def search
    @places = Place.search(params[:search]).page(params[:page]).per(4)
    render json: PlaceSerializer.new(@places).serialized_json
  end

  # GET /places/1 or /places/1.json
  def show
    options = {}
    options[:include] = [:place, :'place.description']
    render json: PlaceHistorySerializer.new(@place_history, options).serialized_json
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places or /places.json
  def create
    @place = Place.new(place_params)
    if @place.save
      render json: to_json_serializer(@place), status: 201
    else
      render json: {errors: @place.errors},status: 422
    end
  end

  # PATCH/PUT /places/1 or /places/1.json
  def update
    respond_to do |format|
      if @place.update(area_params)
        respond_if_is_true_web(format, places_url, 'Place was successfully updated.', :show, :ok, @place)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @place.errors, :unprocessable_entity)
      end
    end
  end

  # DELETE /places/1 or /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: "Place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:description, :qr_code, :institution_id)
    end
end



