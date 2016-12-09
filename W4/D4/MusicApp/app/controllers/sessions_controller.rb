class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      log_in_user!(@user)
      flash[:messages] = ['welcome back']
      redirect_to user_url(@user)
    else
      flash.now[:messages] = ['invalid log credentials']
      render :new
    end
  end

  def destroy
    log_out
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
