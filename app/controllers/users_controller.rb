class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy
    
  end

  private 
  def set_user
    @user = User.find(params[id])
  end
  
  def user_params
    params.require(:User).permit(:id, :email, :name, :private_number)
  end
end