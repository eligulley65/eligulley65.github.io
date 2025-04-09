class RecommendationsController < ApplicationController
    def index
      @recommendations = Recommendation.all
      render json: @recommendations
    end
  
    def create
      @recommendation = Recommendation.new(rating_params)
  
      if @recommendation.save
        render json: @recommendation, status: :created
      else
        render json: {error: 'Recommendation creation failed'}, status: :unprocessable_entity
      end
    end
  
    def show
      @recommendation = Recommendation.find(params[:id])
  
      if @recommendation
        render json: @recommendation, status: :ok
      else
        render json: {error: 'Recommendation not found'}, status: :not_found
      end
    end
  
    def update
      @recommendation = Recommendation.find(params[id])
      
      if @recommendation.update(rating_params)
        render json: @recommendation, status: :ok
      else
        render json: {error: 'Recommendation update failed'}, status: :unprocessable_entity
      end
    end
  
    def destroy
      @recommendation = Recommendation.find(params[:id])
      
      if @recommendation.destroy
        render json: {message: 'Recommendation successfully deleted'}, status: :ok
      else
        render json: {error: 'Recommendation deletion failed'}, status: :internal_server_error
      end
    end
  
    private
  
    def recommendation_params
      params.permit(:score, :user_id, :media_id)
    end
  end
  