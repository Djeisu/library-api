namespace :sample_author do
  desc 'sample_author'
  task all: [
    :'sample_author:create_author'
  ]

  task create_author: :environment do
    Author.destroy_all

    Author.create name: "J.K. Rowling"

    puts "Authors Created"
  end
end
