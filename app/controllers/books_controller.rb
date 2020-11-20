class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render action: :index
    end
  end

  def edit
  end

  private
  def book_params
     params.require(:book).permit(:title, :body)
  end


end
