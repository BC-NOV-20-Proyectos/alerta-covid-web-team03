# Symptoms controller web
class API::V1::SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ show ]

  # GET /symptoms or /symptoms.json
  def index
    @symptoms = Symptom.all
     render json: SymptomSerializer.new(@symptoms).serialized_json
  end

  def search
    @symptoms = Symptom.search(params[:search]).page(params[:page]).per(4)    
  end

  # GET /symptoms/1 or /symptoms/1.json
  def show
     render json: SymptomSerializer.new(@symptom).serialized_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def symptom_params
      params.require(:symptom).permit(:description,:search)
    end
end
