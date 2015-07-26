class IndoorsController < ApplicationController
  def show
    @indoor = Indoor.find(id_params[:id])
    @kadais = @indoor.indoorkadais.where(newflag: 1).order("wallname ASC").order("grade ASC")
    @oldkadais = @indoor.indoorkadais.where(newflag: 0)
    @indoorkadai = Indoorkadai.new(create_params)
  end

  private
  def id_params
    params.permit(:id, :newflag)
  end

  def create_params
    params.permit(:indoor_id, :wallname, :routename, :grade, :newflag, :color, :kadaipic)
  end
end
