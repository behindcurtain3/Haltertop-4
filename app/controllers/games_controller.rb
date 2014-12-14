class GamesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
  end

  def show
  end
  
  def new
    @game = Game.new
  end

  def create
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:black_id, :white_id, :private)
    end
end
