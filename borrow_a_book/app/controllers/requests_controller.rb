class RequestsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @request = Request.new
  end

  def create
    @book = Book.find(params[:book_id])

    @request = @book.requests.new(request_params)
    @request.user_id = current_user.id
    @request.book_id = @book.id
    @request.save

    redirect_to('/books')
    flash[:alert] = "You have made a request for #{@book.title}"
  end

  private

  def request_params
    params.require(:request).permit(:requests)
  end

end
