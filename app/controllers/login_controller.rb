class LoginController < ApplicationController
  before_action :redirect_logged_users, except: :destroy

  def new
  end

  def create
    #user = User.where("email = :credential OR login = :credential", credential: params[:credential].to_s).first
    user = Authenticator.authenticate(
      params[:credential],
      params[:password]
    )

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id
      redirect_to "/tasks"
    else
      flash.alert = t("flash.login.create.alert")
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end
end
