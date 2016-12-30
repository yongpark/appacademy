class TriviaController < ApplicationController
  def index
    @trivia = Trivium.all

    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end
  end

  def create
    @trivium = Trivium.new(trivium_params)
    if @trivium.save!
      render json: @trivium
    else
      render json: @trivium.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def trivium_params
    params.require(:trivium).permit(:fact)
  end
end
