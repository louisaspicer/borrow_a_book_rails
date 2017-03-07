class RequestsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @request = Request.new
  end

  def request_params
    params.require(:request).permit(:requests)
  end

end
