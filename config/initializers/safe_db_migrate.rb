Rails.logger.info "Starting safer db:migrate"

if ENV['VERSION'] != nil && ENV['EVIL_ALLOW_DANGEROUSLY_MIGRATION_VERSION'] != "true"
  Rails.logger.fatal %{
    You are running rake db:migrate with target VERSION set. This is DAN·GER·OUS·LY
    and can DELETE your entire database.

    If you really want to proceed with this shit, set EVIL_ALLOW_DANGEROUSLY_MIGRATION_VERSION
    environment variable to true. It is at your own risky.
  }

  throw "Aborting db:migrate due VERSION env var is setted."
elsif ENV['VERSION'] != nil
  Rails.logger.warn %{
    You are running db:migrate with VERSION env var setted. It can DESTROY your database!
  }
end
