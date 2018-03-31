class BooksController < ApplicationController
  before_action :authenticate_user!, :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.published
  end

  def new
    @books = Book.new
  end

  def create
    @books = Book.new(book_params)
    if @books.save
      flash[:notice] = 'Book has been created.'
      redirect_to @books
    else
      flash.now[:alert] = 'Missing field, book could not be created'
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @books.update(book_params)
      flash[:notice] = 'Book has been updated.'
      redirect_to @books
    else
      flash.now[:alert] = 'Book has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @books.destroy

    flash[:notice] = 'Book has been deleted.'
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :summary)
  end

  def set_book
    @books = Book.find(params[:id])
  rescue Mongoid::Errors::DocumentNotFound
    flash[:alert] = 'The book you were trying to find could not be found.'
    redirect_to book_path
  end
end
