# frozen_string_literal: true

# Institutions controller web
class API::V1::InstitutionsController < ApplicationController
  before_action :set_institution, only: %i[show]

  # GET /institutions or /institutions.json
  def index
    @institutions = Institution.all.page(params[:page]).per(5)
    render json: InstitutionSerializer.new(@institutions).serialized_json
  end

  def search
    @institutions = Institution.search(params[:search]).page(params[:page]).per(5)
    render json: InstitutionSerializer.new(@institutions).serialized_json
  end

  # GET /institutions/1 or /institutions/1.json
  def show
    render json: InstitutionSerializer.new(@institution).serialized_json
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def institution_params
    params.require(:institution).permit(:description, :search)
  end
end
