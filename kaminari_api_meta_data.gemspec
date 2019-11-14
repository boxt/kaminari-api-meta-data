# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kaminari_api_meta_data/version"

Gem::Specification.new do |spec|
  spec.name = "kaminari-api-meta-data"
  spec.version = KaminariApiMetaData::VERSION
  spec.authors = ["BOXT Developers"]
  spec.email = ["developers@boxt.co.uk"]
  spec.homepage = "https://github.com/boxt/kaminari-api-meta-data"
  spec.summary = "A gem for adding Kaminari collection meta data to your API responses"
  spec.description = "A gem for adding Kaminari collection meta data to your API responses that matches the format "\
                     "that works with Kaminari paginate method."
  spec.license = "MIT"

  spec.files = Dir[
    "lib/**/*",
    "MIT-LICENSE",
    "Rakefile",
    "README.md",
    "VERSION"
  ]

  spec.add_dependency "kaminari", "~> 1.1"

  spec.add_development_dependency "boxt_ruby_style_guide", "~> 2.1"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.11"
  spec.add_development_dependency "minitest-bang", "~> 1.0"
  spec.add_development_dependency "minitest-fail-fast", "~> 0.1"
  spec.add_development_dependency "minitest-macos-notification", "~> 0.1"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
  spec.add_development_dependency "mocha", "~> 1.8"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "simplecov", "~> 0.16"
end
