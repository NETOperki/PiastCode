class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Twoje konto zostało utworzone"
      redirect_to :root
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :email, :telephone, :password, :password_confirmation)
    end
end
