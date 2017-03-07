class CommentsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @comment = Comment.new
  end

  def create
    @book = Book.find(params[:book_id])

    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    redirect_to('/books')

  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])

    @comment.destroy
    redirect_to '/books'

    flash[:success] = "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end

end
