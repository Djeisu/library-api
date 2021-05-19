class Author < ApplicationRecord
  has_many :author_books

  def structure_json
    {
      id: id,
      name: name,
    }
  end
end
