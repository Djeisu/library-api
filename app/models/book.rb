class Book < ApplicationRecord
  has_many :author_books

  def structure_json
    {
      title: title,
      description: description,
      author: authors
    }
  end

  def authors
    author_books.map do
      |ab| ab.author.structure_json
    end
  end
end
