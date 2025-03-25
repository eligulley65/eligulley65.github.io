class UsersController < ApplicationController
  def index
	@users = User.all
	render json: @users
  end

  def create
	@user = User.new(user_params)

	if @user.save
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

  def ratings
	@ratings = User.find(params[:id]).ratings
	
	if @ratings
	  render json: @ratings
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
	params.permit(:username, :password)
  end
end
