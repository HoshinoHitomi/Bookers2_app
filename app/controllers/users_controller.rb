class UsersController < ApplicationController

  def index
    @newbook = Book.new
    @users = User.all
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end
end
