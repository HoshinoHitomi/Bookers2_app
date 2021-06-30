class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update]
    before_action :authenticate_user!

  def index
    @newbook = Book.new
    @users = User.all
    @login_user = User.find_by(id: current_user.id)
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
     user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
