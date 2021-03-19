# Areas controller web
class API::V1::AreasController < ApplicationController
  before_action :set_area, only: %i[ show ]

  # GET /areas or /areas.json
  def index
    @areas = Area.all.page(params[:page]).per(4)
    render json: AreaSerializer.new(@areas).serialized_json
  end

  def search
    @areas = Area.search(params[:search]).page(params[:page]).per(4)
    render json: AreaSerializer.new(@areas).serialized_json
  end

  # GET /areas/1 or /areas/1.json
  def show
    render json: AreaSerializer.new(@area).serialized_json
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:description, :qrcode, :institution_id)
    end
end
