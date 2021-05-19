namespace :sample_user do
  desc 'sample_user'
  task all: [
    :'sample_user:create_user'
  ]

  task create_user: :environment do
    User.destroy_all

    User.create name: "admin",
                email: "admin@admin.com",
                password: "123456",
                nickname: "admin"

    puts "User Created"
  end
end
