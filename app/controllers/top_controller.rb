class TopController < ApplicationController
  def index
    @indoors = Indoor.page(params[:page]).per(15)
  end

  def search
    @indoors = Indoor.where("name LIKE(?)", "%#{params[:keyword]}%").limit(20)
    @prefecindoors = Indoor.where("prefecture LIKE(?)", "%#{params[:keyword]}%").limit(20)
  end

end
