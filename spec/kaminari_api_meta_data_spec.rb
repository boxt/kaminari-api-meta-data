# frozen_string_literal: true

require "spec_helper"

class Dummy
  include(::KaminariApiMetaData)
end

describe KaminariApiMetaData do
  describe "VERSION" do
    let(:current_version) { File.read("VERSION").split("\n").first }

    it "is set from the VERSION file" do
      expect(::KaminariApiMetaData::VERSION).to eq(current_version)
    end
  end

  describe "#meta_data" do
    let(:collection) { Struct.new(:current_page, :next_page, :limit_value, :prev_page, :total_pages, :total_count) }
    let(:dummy) { Dummy.new }
    let(:kaminari_collection) { collection.new(1, 2, 20, nil, 10, 23) }

    describe "with no extra meta data" do
      let(:expected) do
        { current_page: 1, next_page: 2, per_page: 20, prev_page: nil, total_pages: 10, total_count: 23 }
      end

      it "returns meta attributes" do
        expect(dummy.meta_data(kaminari_collection)).to(eq(expected))
      end
    end

    describe "with extra meta data" do
      let(:expected) do
        { current_page: 1, next_page: 2, per_page: 20, prev_page: nil, total_pages: 10, total_count: 23, foo: "bar" }
      end

      it "returns meta attributes" do
        expect(dummy.meta_data(kaminari_collection, foo: "bar")).to(eq(expected))
      end
    end
  end
end
