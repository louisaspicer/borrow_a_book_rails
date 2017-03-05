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
    redirect_to('/books')
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(books_params)
    redirect_to('/books')
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "#{@book.title} deleted successfully"
    redirect_to '/books'
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :image)
  end

end
