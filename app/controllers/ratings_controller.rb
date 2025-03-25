class RatingsController < ApplicationController
  def index
	@ratings = Rating.all
	render json: @ratings
  end

  def create
	@rating = Rating.new(rating_params)

	if @rating.save
	  render json: @rating, status: :created
	else
	  render json: {error: 'Rating creation failed'}, status: :unprocessable_entity
	end
  end

  def show
	@rating = Rating.find(params[:id])

	if @rating
	  render json: @rating, status: :ok
	else
	  render json: {error: 'Rating not found'}, status: :not_found
	end
  end

  def update
	@rating = Rating.find(params[id])
	
	if @rating.update(rating_params)
	  render json: @rating, status: :ok
	else
	  render json: {error: 'Rating update failed'}, status: :unprocessable_entity
	end
  end

  def destroy
	@rating = Rating.find(params[:id])
	
	if @rating.destroy
	  render json: {message: 'Rating successfully deleted'}, status: :ok
	else
	  render json: {error: 'Rating deletion failed'}, status: :internal_server_error
	end
  end

  private

  def rating_params
	params.permit(:score, :user_id)
  end
end
