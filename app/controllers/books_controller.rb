class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @newbook = Book.new
  end

  def create
    @newbook = Book.new
    @newbook.user_id = current_user.id
    @newbook.save
    redirect_to book_path(@newbook)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
