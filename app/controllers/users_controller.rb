class UsersController < ApplicationController

  def index
    @newbook = Book.new
    @users = User.all
    @login_user = User.find_by(id: current_user.id)
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
    if @user.update(user_params)
      flash[:notice]= "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  def correct_post
    @user = User.find(params[:id])
    unless @user == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
