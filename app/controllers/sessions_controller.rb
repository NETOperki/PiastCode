class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:positive] = "Zalogowano użytkownika"
      redirect_to root_path
    else
      flash.now[:negative] = "Błedny adres email i/lub hasło."
      render :new
    end
  end

  def destroy
    flash[:positive] = "Wylogowano użytkownika z systemu. Do zobaczenia!"
    log_out
    redirect_to root_path
  end
end
