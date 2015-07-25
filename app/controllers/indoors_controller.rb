class IndoorsController < ApplicationController
  def show
    @indoor = Indoor.find(id_params[:id])
    @indoorkadai = Indoorkadai.new(create_params)
  end

  private
  def id_params
    params.permit(:id)
  end

  def create_params
    params.permit(:indoor_id, :wallname, :routename, :grade, :newflag, :color, :kadaipic)
  end
end
