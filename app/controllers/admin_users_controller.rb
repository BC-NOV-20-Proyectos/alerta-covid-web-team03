#Admin controller for users.
class AdminUsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_role_params, only: [:create, :update]
  def new
    @user = User.new
  end

  def index
    #investigar para que sirve el .page y .per
    @users = User.all.page(params[:page]).per(50)
  end

  def search
    @users = User.search(params[:search]).page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params)
    @user.control_number = control_number_method
    respond_to do |format|
      if @user.save
        set_role(@params_admin)
        respond_if_is_true_web(format, admin_users_path, 'User was successfully created', :show, :created, @user)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @user.errors, :unprocessable_entity)
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @params_admin == "on" ? update_rol(@user) : nil
        respond_if_is_true_web(format, admin_users_path, 'User was successfully updated', :show, :created, @user)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @user.errors, :unprocessable_entity)
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_role_params
    @params_admin = params[:admin]
  end

  def control_number_method
    numero = User.last.id + 1
    result = "21"+ numero.to_s
    result.to_i
  end

  def set_role(data)
    if data == "on"
      @user.add_role "admin"
    else
      @user.add_role "normal"
    end
  end

  def update_rol(user)
    puts user.inspect
    user.roles.each do |rol|
      @name_asign = rol.name == "admin" ? "normal" : "admin"
      user.remove_role rol.name.to_sym
    end
    user.add_role @name_asign.to_s
  end

  def user_params
    params.require(:user).permit(:id, :email, :name, :lasname, :control_number, :password, :password_cofirmation, :area_id, :institution_id)
  end
end
