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
      @movie_genres = MovieToGenre.find(params[:id])

      if @movie_genres
        render json: @movie_genres, status: :ok
      else
        render json: {error: 'Genres not found'}, status: :not_found
      end
    end

    def genresFind
      @genres = MovieGenre.find(params[:id])

      if @genres
        render json: @genres, status: :ok
      else
        render json: {error: 'Genre not found'}, status: :not_found
      end
    end

    def ratings
      @movie = Movie.find(params[:id])
      @ratings = movie.Ratings

      if @ratings
        render json: @ratings, status: :ok
      else
        render json: {error: 'Ratings not found'}, status: :not_found
    end

  end
  