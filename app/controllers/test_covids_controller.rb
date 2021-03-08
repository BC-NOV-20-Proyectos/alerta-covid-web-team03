class TestCovidsController < ApplicationController
  before_action :set_test_covid, only: %i[ show edit update destroy ]

  # GET /test_covids or /test_covids.json
  def index
    @test_covids = TestCovid.all
  end

  # GET /test_covids/1 or /test_covids/1.json
  def show
  end

  # GET /test_covids/new
  def new
    @test_covid = TestCovid.new
  end

  # GET /test_covids/1/edit
  def edit
  end

  # POST /test_covids or /test_covids.json
  def create
    @test_covid = TestCovid.new(test_covid_params)

    respond_to do |format|
      if @test_covid.save
        format.html { redirect_to @test_covid, notice: "Test covid was successfully created." }
        format.json { render :show, status: :created, location: @test_covid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test_covid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_covids/1 or /test_covids/1.json
  def update
    respond_to do |format|
      if @test_covid.update(test_covid_params)
        format.html { redirect_to @test_covid, notice: "Test covid was successfully updated." }
        format.json { render :show, status: :ok, location: @test_covid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test_covid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_covids/1 or /test_covids/1.json
  def destroy
    @test_covid.destroy
    respond_to do |format|
      format.html { redirect_to test_covids_url, notice: "Test covid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_covid
      @test_covid = TestCovid.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_covid_params
      params.require(:test_covid).permit(:date_did, :date_get_result, :had_symptoms, :type_test, :result)
    end
end
