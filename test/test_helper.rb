# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "kaminari_api_meta_data"

require "minitest/autorun"
require "minitest/bang"
require "minitest/fail_fast"
require "minitest/macos_notification"
require "minitest/reporters"
require "mocha/minitest"

Minitest::Reporters.use!(
  [
    Minitest::Reporters::DefaultReporter.new,
    Minitest::Reporters::MacosNotificationReporter.new(title: "Kaminari API Meta Data gem")
  ],
  "test",
  Minitest.backtrace_filter
)
