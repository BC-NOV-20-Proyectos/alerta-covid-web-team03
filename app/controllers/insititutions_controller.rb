# frozen_string_literal: true

# Institutions controller web
class InstitutionsController < ApplicationController
  before_action :set_insititution, only: %i[show edit update destroy]

  # GET /insititutions or /insititutions.json
  def index
    @insititutions = Insititution.all
  end

  # GET /insititutions/1 or /insititutions/1.json
  def show; end

  # GET /insititutions/new
  def new
    @insititution = Insititution.new
  end

  # GET /insititutions/1/edit
  def edit; end

  # POST /insititutions or /insititutions.json
  def create
    @insititution = Insititution.new(insititution_params)

    respond_to do |format|
      if @insititution.save
        respond_if_is_true_web(@insititution, 'Insititution was successfully created.', :show, :created, @insititution)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @insititution.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /insititutions/1 or /insititutions/1.json
  def update
    respond_to do |format|
      if @insititution.update(insititution_params)
        respond_if_is_true_web(@insititution, 'Insititution was successfully created.', :show, :ok, @insititution)
      else
        respond_if_is_false_web(:edit, :unprocessable_entity, @insititution.errors, :unprocessable_entity)
      end
    end
  end

  # DELETE /insititutions/1 or /insititutions/1.json
  def destroy
    @insititution.destroy
    respond_to do |format|
      format.html { redirect_to insititutions_url, notice: 'Insititution was successfully destroyed.' }
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
