class UsersController < ApplicationController
  def index
	@users = User.all
	render json: @users
  end

  def create
	@user = User.new(user_params)

	if @user.save
	  @rating = MovieRating.find_or_initialize_by(user_id: @user.id, movie_id: 2)
	  @rating.score = 0
	  if @rating.save
		render json: @rating, status: :created
	  render json: @user, status: :created
	else
	  render json: {error: 'User creation failed'}, status: :unprocessable_entity
	end
  end

  def show
	@user = User.find(params[:id])

	if @user
	  render json: @user, status: :ok
	else
	  render json: {error: 'User not found'}, status: :not_found
	end
  end

  def login
	user = User.find_by(email: params[:email])

	if user && user.password == params[:password]
	  render json: { user: user }, status: :ok
	else
	  user = User.find_by(username: params[:username])
	  if user && user.password == params[:password]
		render json: { user: user }, status: :ok
	  else
		render json: { error: 'Invalid email or password' }, status: :unauthorized
	  end
	end
  end

  def ratings
	@user = User.find(params[:id])

	if @user
		render json: {
			game_ratings: @user.game_ratings,
			show_ratings: @user.show_ratings,
			movie_ratings: @user.movie_ratings
		  }, status: :ok
	else
	  render json: {error: 'Ratings not found'}, status: :not_found
	end
  end

  def update
	@user = User.find(params[:id])

	if @user.update(user_params)
	  render json: @user
	else
	  render json: {error: 'User update failed'}, status: :not_found
	end
  end

  def updateGenres
	@user = User.find(params[:id])

	if @user.update(genre_params)
		render json: @user
	else
		render json: {error: 'User Genres update failed'}, status: :not_found
	end
  end

  def destroy
	@user = User.find(params[:id])

	if @user.destroy
	  render json: {message: 'User successfully deleted'}, status: :ok
	else
	  render json: {error: 'User deletion failed'}, status: :internal_server_error
	end
  end

  private

  def user_params
	params.permit(:username, :password, :backendName, :email, :dateOfBirth, :genre_json)
  end

  def genre_params
	params.permit(:genre_json)
  end
end
