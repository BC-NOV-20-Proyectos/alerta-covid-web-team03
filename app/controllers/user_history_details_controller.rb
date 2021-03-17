# User History controller web
class UserHistoryDetailsController < ApplicationController
  before_action :set_user_history_detail, only: %i[ show edit update destroy ]

  # GET /user_history_details or /user_history_details.json
  def index
    @user_history_details = UserHistoryDetail.all
  end

  # GET /user_history_details/1 or /user_history_details/1.json
  def show
  end

  # GET /user_history_details/new
  def new
    @user_history_detail = UserHistoryDetail.new
  end

  # GET /user_history_details/1/edit
  def edit
  end

  # POST /user_history_details or /user_history_details.json
  def create
    @user_history_detail = UserHistoryDetail.new(user_history_detail_params)

    respond_to do |format|
      if @user_history_detail.save
        format.html { redirect_to @user_history_detail, notice: "User history detail was successfully created." }
        format.json { render :show, status: :created, location: @user_history_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_history_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_history_details/1 or /user_history_details/1.json
  def update
    respond_to do |format|
      if @user_history_detail.update(user_history_detail_params)
        format.html { redirect_to @user_history_detail, notice: "User history detail was successfully updated." }
        format.json { render :show, status: :ok, location: @user_history_detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_history_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_history_details/1 or /user_history_details/1.json
  def destroy
    @user_history_detail.destroy
    respond_to do |format|
      format.html { redirect_to user_history_details_url, notice: "User history detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_history_detail
      @user_history_detail = UserHistoryDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_history_detail_params
      params.require(:user_history_detail).permit(:user_history_id, :symtptom_id)
    end
end
