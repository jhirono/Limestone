class FavoritesController < ApplicationController

  def update
    @favorite = Favotie.find_or_create_by(indoor_id: params[:indoor.id], user_id: current_user.id)
  end

  def destroy
    @favorite = Favorite.find_by(params[:id])
    @favorite.destroy
  end

end