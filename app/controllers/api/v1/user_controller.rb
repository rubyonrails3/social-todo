class Api::V1::UserController < ApplicationController

  before_action :authenticate, except: [:create, :login]

  def create
    @user = services['CreatesUser'].create params: user_params
    respond_to do |format|
      format.json { render template: 'api/v1/user/create', status: :created }
    end
  end

  def login
    @user = services['LoginUser'].login params: params.slice(:email, :password)
    respond_to do |format|
      format.json { render template:  'api/v1/user/create', status: :ok }
    end
  end

  def logout
    services['LogoutUser'].logout current_user: current_user
    respond_to do |format|
      format.json { render json: "", status: :no_content }
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
