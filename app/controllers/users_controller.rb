class UsersController < ApplicationController

  def index
    @newbook = Book.new
    @users = User.all
    @loginuser = User.find_by(id: current_user.id)
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
