class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
    
  
  end

  def create
    @game.create(game_params)
    redirect_to game_path(:game_id) 
  end

  def show
    @game = Game.find_by_id(params[:id])

    if user_signed_in?
      redirect_to game_path(@game)
    else
      redirect_to new_user_session_path
    end

  end

  private

  def game_params
    params.require(:game).permit(:id, :white_player, :black_player, :winner)
  end
end


