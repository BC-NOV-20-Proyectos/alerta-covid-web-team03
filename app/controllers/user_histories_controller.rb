class UserHistoriesController < ApplicationController
  before_action :set_user_history, only: %i[ show edit update destroy ]

  # GET /user_histories or /user_histories.json
  def index
    @user_histories = UserHistory.all
  end

  # GET /user_histories/1 or /user_histories/1.json
  def show
  end

  # GET /user_histories/new
  def new
    @user_history = UserHistory.new
  end

  # GET /user_histories/1/edit
  def edit
  end

  # POST /user_histories or /user_histories.json
  def create
    @user_history = UserHistory.new(user_history_params)

    respond_to do |format|
      if @user_history.save
        format.html { redirect_to @user_history, notice: "User history was successfully created." }
        format.json { render :show, status: :created, location: @user_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_histories/1 or /user_histories/1.json
  def update
    respond_to do |format|
      if @user_history.update(user_history_params)
        format.html { redirect_to @user_history, notice: "User history was successfully updated." }
        format.json { render :show, status: :ok, location: @user_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_histories/1 or /user_histories/1.json
  def destroy
    @user_history.destroy
    respond_to do |format|
      format.html { redirect_to user_histories_url, notice: "User history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_history
      @user_history = UserHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_history_params
      params.require(:user_history).permit(:date, :user_id)
    end
end
