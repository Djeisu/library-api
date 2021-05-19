namespace :sample_author_book do
  desc 'sample_author_book'
  task all: [
    :'sample_author_book:create_author_book'
  ]

  task create_author_book: :environment do
    AuthorBook.destroy_all

    AuthorBook.create author: Author.find_by(name: "J.K. Rowling"),
                      book: Book.find_by(title: "Harry Potter and the Prisoner of Azkaban")

    puts "Author Book Created"
  end
end
