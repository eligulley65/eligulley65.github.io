class GamesController < ApplicationController
    def index
      @games = Game.all
      render json: @games
    end
  
    def create
      @games = Game.new(game_params)
  
      if @game.save
        render json: @game, status: :created
      else
        render json: {error: 'Game creation failed'}, status: :unprocessable_entity
      end
    end
  
    def show
      @game = Game.find(params[:id])
  
      if @game
        render json: @game, status: :ok
      else
        render json: {error: 'Game not found'}, status: :not_found
      end
    end

    def ratings
        @game = Game.find(params[:id])
        @ratings = game.Ratings
  
        if @ratings
          render json: @ratings, status: :ok
        else
          render json: {error: 'Ratings not found'}, status: :not_found
        end
      end
  
    private
  
    def game_params
      params.permit(:game_id, :age_rating_id, :cover_url, :first_release_date, :franchise, :name, :rating, :rating_count, :slug, :summary, :total_rating, :total_rating_count, :version_parent, :version_title, :average_rating)
    end
  end
  