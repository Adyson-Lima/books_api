class Api::V1::BooksController < ApplicationController

  before_action :set_book, only: %i[ show update destroy] #show update destroy

  def index
    @books = Book.all
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created, location: api_v1_book_url(@book)
    else
      render json: @book.errors, status: :internal_server_error
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :internal_server_error
    end
  end

  def destroy
    @book.destroy
  end
  
private

def set_book
  @book = Book.find(params[:id])
end

def book_params
  params.require(:book).permit(:title, :description)
end

end