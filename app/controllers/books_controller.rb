class BooksController < ApplicationController
before_action :set_book, only:[:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show; end

  def new; end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render action: :index
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
     params.require(:book).permit(:title, :body)
  end

  def set_book
    @book = Book.find(params[:id])
  end


end
