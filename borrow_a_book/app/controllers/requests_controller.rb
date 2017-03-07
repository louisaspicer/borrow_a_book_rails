class RequestsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @request = Request.new
  end

end
