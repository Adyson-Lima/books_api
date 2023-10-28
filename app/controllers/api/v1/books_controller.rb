class Api::V1::BooksController < ApplicationController

  #before_action :set_book, only: %i[ show update destroy ]

  def index
    @books = Book.all
    render json: @books
  end
  
private

def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:title, :description)
end

end