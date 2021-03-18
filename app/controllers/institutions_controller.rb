# frozen_string_literal: true

# Institutions controller web
class InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[show edit update destroy]

  # GET /institutions or /institutions.json
  def index
    @institutions = Institution.all
  end

  # GET /institutions/1 or /institutions/1.json
  def show; end

  # GET /institutions/new
  def new
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit; end

  # POST /institutions or /institutions.json
  def create
    @institution = institution.new(institution_params)

    respond_to do |format|
      if @institution.save
        respond_if_is_true_web(@institution, 'institution was successfully created.', :show, :created, @institution)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @institution.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /institutions/1 or /institutions/1.json
  def update
    respond_to do |format|
      if @institution.update(institution_params)
        respond_if_is_true_web(@institution, 'institution was successfully created.', :show, :ok, @institution)
      else
        respond_if_is_false_web(:edit, :unprocessable_entity, @institution.errors, :unprocessable_entity)
      end
    end
  end

  # DELETE /institutions/1 or /institutions/1.json
  def destroy
    @institution.destroy
    respond_to do |format|
      format.html { redirect_to institutions_url, notice: 'institution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = institution.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def institution_params
    params.require(:institution).permit(:description)
  end
end
