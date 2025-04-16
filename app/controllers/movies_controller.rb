class MoviesController < ApplicationController
    def index
      per_page = (params[:per_page] || 100).to_i
      page = (params[:page] || 1).to_i
      offset = (page - 1) * per_page
        
      movies = Movie
        .includes(:movie_genres)
        .offset(offset)
        .limit(per_page)
        
      render json: {
        movies: movies.as_json(include: :movie_genres),
        current_page: page,
        per_page: per_page,
        next_page: movies.size == per_page ? page + 1 : nil,
        total_count: Movie.count
      }
    end
  
    def show
      @movies = Movie.includes(:movie_genres).find(params[:id])
  
      if @movies
        render json: {
          movie: @movies,
          show_genres: @movies.movie_genres
        }, status: :ok
      else
        render json: {error: 'Movie not found'}, status: :not_found
      end
    end
  end
  