class AdminUsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def index
    #investigar para que sirve el .page y .per
    @users = User.all.page(params[:page]).per(35)
  end

  def search
    @users = User.search(params{:search}).page(paramas[:page]).per(4)
  end

  def create
    #diferencia entre new y create
    @user = User.new(user_params)
    #buscar como funciona el respont_to
    respond_to do |format|
      if @user.save
        #para que son el :show y :created | pareametros que son pasados a repond_if_is_true_web
        respond_if_is_true_web(format, admin_users_path, 'User was successfully created', :show, :created, @user)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @user.errors, :unprocessable_entity)
      end

    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        respond_if_is_true_web(format, admin_users_path, 'User was successfully updated', :show, :created, @user)
      else
        respond_if_is_false_web(format, :new, :unprocessable_entity, @user.errors, :unprocessable_entity)
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
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

  def user_params
    params.require(:user).permit(:id, :email, :name, :lasname, :control_number, :password, :password_cofirmation, :id)
  end
end
