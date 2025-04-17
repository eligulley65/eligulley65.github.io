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
      @ratings = show.Ratings

      if @ratings
        render json: @ratings, status: :ok
      else
        render json: {error: 'Ratings not found'}, status: :not_found
      end
    end
  end
  