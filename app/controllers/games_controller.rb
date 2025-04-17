class GamesController < ApplicationController
    def index
      per_page = (params[:per_page] || 100).to_i
      page = (params[:page] || 1).to_i
      offset = (page - 1) * per_page
        
      games = Game
        .includes(:game_genres)
        .offset(offset)
        .limit(per_page)
        
      render json: {
        game: games.as_json(include: :game_genres),
        current_page: page,
        per_page: per_page,
        next_page: games.size == per_page ? page + 1 : nil,
        total_count: Game.count
      }
    end
  
    def show
      @games = Game.includes(:game_genres).find(params[:id])
  
      if @game
        render json: {
          game: @games,
          game_genres: @games.game_genres
        }, status: :ok
      else
        render json: {error: 'Game not found'}, status: :not_found
      end
    end

    def ratings
        @game = Game.find(params[:id])
        @ratings = game.Game_Rating
  
        if @ratings
          render json: @ratings, status: :ok
        else
          render json: {error: 'Ratings not found'}, status: :not_found
        end
      end
    
    def createRating
      @rating = GameRating.new(rating_params)

      if rating.save
        render json: @rating, status: :created
	    else
	      render json: {error: 'Rating creation failed'}, status: :unprocessable_entity
	    end
    end
  
    private
  
    def rating_params
      params.permit(:user_id, :game_id, :score)
    end

    def game_params
      params.permit(:game_id, :age_rating_id, :cover_url, :first_release_date, :franchise, :name, :rating, :rating_count, :slug, :summary, :total_rating, :total_rating_count, :version_parent, :version_title, :average_rating)
    end
  end
  
