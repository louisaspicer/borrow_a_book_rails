class BooksController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(books_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to('/books')
    else
      redirect_to('/books/new')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if authenticate_book_owner(@book)
      @book.update(books_params)
      redirect_to root_path
    else
      flash[:alert] = "You can't edit a book that you don't own"
      redirect_to root_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if authenticate_book_owner(@book)
      @book.destroy
      flash[:notice] = "#{@book.title} deleted successfully"
      redirect_to books_path
    else
      flash[:alert] = "You can't delete a book that you don't own"
      redirect_to books_path
    end
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :image, :user_id)
  end

  def authenticate_book_owner(book_object)
     current_user.id == book_object.user_id
  end

end
