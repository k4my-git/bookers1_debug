class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "successfully created book!"
    else
      @books = Book.all
      render 'index', alert: "error_can't be blank"
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      render 'edit', alert: "error_can't be blank"
    end
  end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
