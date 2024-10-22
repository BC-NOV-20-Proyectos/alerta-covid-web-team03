# Symptoms controller web
class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ show edit update destroy ]

  # GET /symptoms or /symptoms.json
  def index
    @symptoms = Symptom.all
  end

  def search
    @symptoms = Symptom.search(params[:search]).page(params[:page]).per(4)    
  end

  # GET /symptoms/1 or /symptoms/1.json
  def show
  end

  # GET /symptoms/new
  def new
    @symptom = Symptom.new
  end

  # GET /symptoms/1/edit
  def edit
  end

  # POST /symptoms or /symptoms.json
  def create
    @symptom = Symptom.new(symptom_params)

    respond_to do |format|
      if @symptom.save
        respond_if_is_true_web(format,symptoms_url, 'Symptom was successfully created.', :show, :created, @symptom)
      else
        respond_if_is_false_web(format,:new, :unprocessable_entity, @symptom.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /symptoms/1 or /symptoms/1.json
  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        respond_if_is_true_web(format,symptoms_url, 'Symptom was successfully created.', :show, :created, @symptom)
      else
        respond_if_is_false_web(format,:edit, :unprocessable_entity, @symptom.errors, :unprocessable_entity)
      end
    end
  end

  # DELETE /symptoms/1 or /symptoms/1.json
  def destroy
    @symptom.destroy
    respond_to do |format|
      format.html { redirect_to symptoms_url, notice: "Symptom was successfully destroyed." }
      format.json { head :no_content }
    end
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
