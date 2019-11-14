# frozen_string_literal: true

module KaminariApiMetaData
  version_file = File.join(File.dirname(__FILE__), "../../VERSION")
  VERSION = File.read(version_file).split("\n").first
end
