class Api::V1::BooksController < Api::V1::BaseController
  def index
    render json: Book.all.map(&:structure_json), status: 200
  end

  def create
    @book = Book.new resource
    save = @book.save!
    if save
      render json: @book.structure_json, status: 200
    else
      render json: { message: "Error on save: #{save.message}" }, status: 402
    end
  rescue ActionController::ParameterMissing
    render json: { message: 'The Params are wrong, please check your keys' }, status: 402
  end

  def update
    @book = Book.find params[:id]
    save = @book.update! resource
    if save
      render json: @book.structure_json, status: 200
    else
      render json: { message: "Error on update: #{save.message}" }, status: 402
    end
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Book not found, please check the book id' }, status: 404
  end

  def resource
    params.require(:book).permit(:title, :description, :image, :author)
  end
end
