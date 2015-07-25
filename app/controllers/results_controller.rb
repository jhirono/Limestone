class ResultsController < ApplicationController
  def create
    Result.create(create_results)
    redirect_to controller: :indoorkadais, action: :show, id: params[:indoorkadai_id]
  end

  def edit
    @result = Result.find(params[:id])
  end

  def show
  end

  def update
    @result = Result.find(params[:id])
    @result.update(create_results)
    redirect_to controller: :indoorkadais, action: :show, id: @result.indoorkadai.id
  end

  private
  def create_results
    params.require(:result).permit(:indoor_id, :indoorkadai_id, :user_id, :trial, :climbtype, :review)
  end
end
