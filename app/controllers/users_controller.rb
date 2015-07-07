class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @service = User::Create.call(user_params)
    @user = @service.user

    if @service.success?
      redirect_to completed_users_path
    else
      render :new
    end
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end
end
