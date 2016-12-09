class UsersController < ApplicationController


    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in_user!(@user)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end

    def show
      if current_user
        render :show
      else
        flash.now[:errors] << "can't look at other's profile page"
      end
    end

    
    private

    def user_params
      params.require(:user).permit(:email, :password)
      #:session token is not a user input
    end
end
