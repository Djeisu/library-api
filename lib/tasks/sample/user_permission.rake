namespace :sample_user_permission do
  desc 'sample_user_permission'
  task all: [
    :'sample_user_permission:create_user_permission'
  ]

  task create_user_permission: :environment do
    UserPermission.destroy_all

    UserPermission.create user: User.find_by(name: "admin"),
                          permission: Permission.find_by(name: "admin")

    puts "User Permissions Created"
  end
end
