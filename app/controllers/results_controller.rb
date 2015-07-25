class ResultsController < ApplicationController
  def create
    Result.create(create_results)
    redirect_to controller: :indoorkadais, action: :show, id: params[:indoorkadai_id]
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def create_results
    params.require(:result).permit(:indoor_id, :indoorkadai_id, :user_id, :trial, :climbtype, :review)
  end
end
