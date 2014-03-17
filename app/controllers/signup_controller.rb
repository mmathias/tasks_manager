class SignupController < ApplicationController
  #renderiza o template
  def new
    @user = User.new
  end

  #salva no banco de dados
  def create
    @user = User.new(user_params)
    if @user.save
      # salva mensagem na sessao
      # controller + action + type of message
      # flash.signup.create.notice
      flash.notice = t("flash.signup.create.notice")

      redirect_to login_path
    else
      render :new
    end

  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :login, :password, :password_confirmation)
  end
end
