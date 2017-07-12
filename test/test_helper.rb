$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "kaminari_api_meta_data"

require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "mocha/mini_test"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
