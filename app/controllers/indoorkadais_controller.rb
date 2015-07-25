class IndoorkadaisController < ApplicationController
  def create
    Indoorkadai.create(create_params)
    redirect_to controller: :indoors, action: :show, id: params[:indoor_id]
  end

  def edit
    @indoorkadai = Indoorkadai.find(params[:id])
  end

  def update
    @indoorkadai = Indoorkadai.find(params[:id])
    @indoorkadai.update(create_params)
    redirect_to controller: :indoors, action: :show, id: @indoorkadai.indoor_id
  end

  def entry
    @indoorkadai = Indoorkadai.find(params[:indoorkadai_id])
    @result      = Result.new(create_results)
  end

  def show
    @indoorkadai = Indoorkadai.order('updated_at DESC').find(params[:id])
    @results      = Result.where(user_id: current_user.id, indoorkadai_id: @indoorkadai.id).order('updated_at DESC')
  end

  private
  def create_params
    params.require(:indoorkadai).permit(:indoor_id, :wallname, :routename, :grade, :newflag, :color, :kadaipic)
  end

  def create_results
    params.permit(:indoor_id, :indoorkadai_id, :user_id, :trial, :climbtype, :review)
  end
end
