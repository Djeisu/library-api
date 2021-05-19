namespace :sample do
  desc 'sample'
  task all: :environment do
    Rake::Task["sample_user:all"].invoke
    Rake::Task["sample_permission:all"].invoke
    Rake::Task["sample_user_permission:all"].invoke

    Rake::Task["sample_author:all"].invoke
    Rake::Task["sample_book:all"].invoke
    Rake::Task["sample_author_book:all"].invoke

    puts "Done"
  end
end
