# Areas controller web
require 'rqrcode'

class AreasController < ApplicationController
  before_action :set_area, only: %i[ show edit update destroy ]

  # GET /areas or /areas.json
  def index
    @areas = Area.all.page(params[:page]).per(4)
  end

  def search
    @areas = Area.search(params[:search]).page(params[:page]).per(4)
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
    @area.qrcode = generate_qrcode(@area.description)
    respond_to do |format|
      if @area.save
        respond_if_is_true_web(format, areas_url, 'Area was successfully created.', :show, :created, @area)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @area.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /areas/1 or /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params.merge(qrcode: generate_qrcode(@area.description)))
        respond_if_is_true_web(format, areas_url, 'Area was successfully updated.', :show, :ok, @area)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @area.errors, :unprocessable_entity)
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

  def generate_qrcode(text)
    qrcode = RQRCode::QRCode.new(text)
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    return Base64.encode64(png.to_s)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_params
      params.require(:area).permit(:description, :qrcode, :institution_id)
    end
end
