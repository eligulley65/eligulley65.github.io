class ShowsController < ApplicationController
    def index
      per_page = (params[:per_page] || 100).to_i
      page = (params[:page] || 1).to_i
      offset = (page - 1) * per_page
        
      shows = Show
        .includes(:show_genres)
        .offset(offset)
        .limit(per_page)
        
      render json: {
        shows: shows.as_json(include: :show_genres),
        current_page: page,
        per_page: per_page,
        next_page: shows.size == per_page ? page + 1 : nil,
        total_count: Show.count
      }
    end
  
    def show
      @shows = Show.includes(:show_genres).find(params[:id])
  
      if @shows
        render json: {
          show: @shows,
          show_genres: @shows.show_genres
        }, status: :ok
      else
        render json: {error: 'Show not found'}, status: :not_found
      end
    end

    def ratings
      @show = Show.find(params[:id])
      @ratings = @show.show_ratings

      if @ratings
        render json: @ratings, status: :ok
      else
        render json: {error: 'Ratings not found'}, status: :not_found
      end
    end

    def createRating
      @rating = ShowRating.find_or_initialize_by(user_id: rating_params[:user_id], show_id: rating_params[:show_id])
      @rating.score = rating_params[:score]

      if @rating.save
        render json: @rating, status: :created
	    else
	      render json: {error: 'Rating creation failed'}, status: :unprocessable_entity
	    end
    end

    private
  
    def rating_params
      params.permit(:user_id, :show_id, :score)
    end
  end
  