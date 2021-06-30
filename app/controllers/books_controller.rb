class BooksController < ApplicationController
  def index
    @books = Book.all
    @newbook = Book.new
    @login_user = User.find_by(id: current_user.id)
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@newbook)
    else
      @books = Book.all
      @login_user = User.find_by(id: current_user.id)
      render :index
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @login_user = User.find_by(id: current_user.id)
    @user =User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
