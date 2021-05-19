namespace :sample_book do
  desc 'sample_book'
  task all: [
    :'sample_book:create_book'
  ]

  task create_book: :environment do
    Book.destroy_all

    Book.create title: "Harry Potter and the Prisoner of Azkaban",
                description: "'Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.' \nWhen the Knight Bus crashes through the darkness and screeches to a halt in front of him, it's the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry's tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss... \nHaving now become classics of our time, the Harry Potter ebooks never fail to bring comfort and escapism to readers of all ages. With its message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new readers. \n",
                image_data: resource_params('harry_potter_and_the_prisoner_of_azkaban', 'harry_potter_and_the_prisoner_of_azkaban', 'jpg')

    puts "Books Created"
  end

  def resource_params(asset_name, file_name, mime_type)
    uploader = ImageUploader.new(:store)
    file = File.new(Rails.root.join("public/assets/images/sample/#{file_name}.#{mime_type}"))
    uploaded_file = uploader.upload(file)
    uploaded_file.to_json
  end
end
