class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      render json: @movies
    end
  
    def show
      @movies = Movie.find(params[:id])
  
      if @movies
        render json: @movies, status: :ok
      else
        render json: {error: 'Rating not found'}, status: :not_found
      end
    end

    def genres
      @movie_genres = Movies_to_movieGenres.find(params[:id])

      if @movie_genres
        render json: @movie_genres, status: :ok
      else
        render json: {error: 'Genres not found'}, status: :not_found
      end
    end

    def genresFind
      @genres = MovieGenres.find(params[:id])

      if @genres
        render json: @genres, status: :ok
      else
        render json: {error: 'Genre not found'}, status: :not_found
      end
    end

  end
  