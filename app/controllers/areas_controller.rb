# Areas controller web
class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]

  # GET /areas or /areas.json
  def index
    @areas = Area.all
  end

  # GET /areas/1 or /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas or /areas.json
  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        respond_if_is_true_web(@area, 'Symptom was successfully created.', :show, :created, @area)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @area.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        respond_if_is_true_web(@area, 'Area was successfully updated.', :show, :ok, @area)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @area.errors, :unprocessable_entity)
      end
    end
  end

  # DELETE /areas/1 or /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: "Area was successfully destroyed." }
      format.json { head :no_content }
    end
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
