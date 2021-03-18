# User history controller web
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
        respond_if_is_true_web(@user_history, 'User history detail was successfully created.', :show, :created, @user_history)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @user_history.errors, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /user_histories/1 or /user_histories/1.json
  def update
    respond_to do |format|
      if @user_history.update(user_history_params)
        respond_if_is_true_web(@user_history, 'User history detail was successfully created.', :show, :ok, @user_history)
      else
        respond_if_is_false_web(:new, :unprocessable_entity, @user_history.errors, :unprocessable_entity)
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
