class CommentsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @comment = Comment.new
  end

  def create
    @book = Book.find(params[:book_id])
    @book.comments.create(comment_params)
    redirect_to('/books')
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end

end
