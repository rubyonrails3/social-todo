class Api::V1::UserController < ApplicationController

  def create
    @user = services['CreatesUser'].create params: user_params
    respond_to do |format|
      format.json { render template: 'api/v1/user/create', status: :created }
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
