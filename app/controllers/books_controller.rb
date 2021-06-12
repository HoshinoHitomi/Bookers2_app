class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book_show = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.permit(:title, :body)
  end

end
