# Institutions controller web
class InsititutionsController < ApplicationController
  before_action :set_insititution, only: %i[ show edit update destroy ]

  # GET /insititutions or /insititutions.json
  def index
    @insititutions = Insititution.all
  end

  # GET /insititutions/1 or /insititutions/1.json
  def show
  end

  # GET /insititutions/new
  def new
    @insititution = Insititution.new
  end

  # GET /insititutions/1/edit
  def edit
  end

  # POST /insititutions or /insititutions.json
  def create
    @insititution = Insititution.new(insititution_params)

    respond_to do |format|
      if @insititution.save
        format.html { redirect_to @insititution, notice: "Insititution was successfully created." }
        format.json { render :show, status: :created, location: @insititution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insititution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insititutions/1 or /insititutions/1.json
  def update
    respond_to do |format|
      if @insititution.update(insititution_params)
        format.html { redirect_to @insititution, notice: "Insititution was successfully updated." }
        format.json { render :show, status: :ok, location: @insititution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insititution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insititutions/1 or /insititutions/1.json
  def destroy
    @insititution.destroy
    respond_to do |format|
      format.html { redirect_to insititutions_url, notice: "Insititution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insititution
      @insititution = Insititution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insititution_params
      params.require(:insititution).permit(:description)
    end
end
