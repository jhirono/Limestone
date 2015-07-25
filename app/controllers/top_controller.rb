class TopController < ApplicationController
  def index
    indoor_ids = Indoorkadai.group(:indoor_id).order("count_indoor_id DESC").limit(15).count(:indoor_id).keys
    @ranking = indoor_ids.map{|id| Indoor.find(id)}
    @indoors = Indoor.page(params[:page]).per(15)
  end

  def search
    @indoors = Indoor.where("name LIKE(?)", "%#{params[:keyword]}%").limit(20)
    unless @indoors.exists?
    @indoors = Indoor.where("address LIKE(?)", "%#{params[:keyword]}%").limit(20)
    end
  end

end
