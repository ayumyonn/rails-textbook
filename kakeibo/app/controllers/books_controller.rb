class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.year = Time.zone.today.year
  end

  def create
    endbook_params = params.require(:book).permit(:year,:month,:inout,:category,:amount)
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:inout,:category,:year,:month,:amount)
  end
end