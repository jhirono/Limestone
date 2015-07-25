class UsersController < ApplicationController
  def show
    @user = User.find(id_params[:id])
  end

  private
  def id_params
    params.permit(:id)
  end

end
