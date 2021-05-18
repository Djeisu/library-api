require 'simplecov'
require 'simplecov-console'
require 'minitest/reporters'

class Minitest::Reporters::SpecReporter
  def record_print_status(test)
    print_colored_status(test)
    # rubocop:todo Style/FormatStringToken
    time = test.time
    print(' (%.2fs)' % time) unless time.nil?
    # rubocop:enable Style/FormatStringToken
    test_name = test.name.gsub(/^test_: /, 'test:')
    print pad_test(test_name)
    puts
  end
end

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/'

  add_filter 'app/jobs/'
  add_filter 'app/uploaders/'
  add_filter 'app/channels/'
  add_filter 'app/mailers/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Views', 'app/views'
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ]
)

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end
  parallelize_teardown do |_worker|
    SimpleCov.result
  end
end
