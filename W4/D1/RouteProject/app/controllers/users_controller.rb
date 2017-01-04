class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(user_params)
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def edit
    render text: "I'm in the edit action!"
  end

  def update
    @user = user.find(params[:id])
     if @user.update(user_params)
       render json: @user
     else
       render(
         json: user.errors.full_messages, status: :unprocessable_entity
       )
     end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: @user
  end

  # Using a private method to encapsulate the permissible parameters
   # is just a good pattern since you'll be able to reuse the same
   # permit list between create and update. Also, you can specialize
   # this method with per-user checking of permissible attributes.
  private
    def user_params
      params.require(:user).permit(:username)
    end
end
