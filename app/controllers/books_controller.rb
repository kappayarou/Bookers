class BooksController < ApplicationController

  def index
      @books = Book.all
  end

  def create
    @books = Book.new(book_params)
    if @books.save
      redirect_to book_path(@books.id), notice: 'your post was successfully'
    else
      @errors_list = @books
      @books = Book.all
      flash.now[:alert] = 'your post was failed'
      render :index
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      redirect_to book_path(@books.id), notice: 'your edit was successfully'
    else
      @errors_list = @books
      flash.now[:alert] = 'your update was failed'
      render :show
    end
  end

  def destroy
    @books = Book.find(params[:id])
    if @books.destroy
      redirect_to "/books", notice: 'your destroy was successfully'
    else
      @books = Book.all
      flash.now[:alert] = 'your destroy was failed'
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
