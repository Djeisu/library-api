namespace :sample_permission do
  desc 'sample_permission'
  task all: [
    :'sample_permission:create_permission'
  ]

  task create_permission: :environment do
    Permission.destroy_all

    Permission.create name: "default"
    Permission.create name: "admin"

    puts "Permissions Created"
  end
end
