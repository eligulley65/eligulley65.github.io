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
          genres: @movies.movie_genres
        }, status: :ok
      else
        render json: {error: 'Movie not found'}, status: :not_found
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

    def createGenres
      @genre = MovieGenre.new(genre_params)

      if @genre.save
        render json: @genre, status: :created
      else
        render json: {error: 'Genre creation failed'}, status: :unprocessable_entity
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

    def genre_params
      params.permit(:movie_id, :genre_id)
    end

  end
  