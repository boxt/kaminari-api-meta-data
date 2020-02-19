# frozen_string_literal: true

require "test_helper"

class KaminariApiMetaDataTest < Minitest::Test
  class Dummy
    include ::KaminariApiMetaData
  end

  describe "KaminariApiMetaDataTest" do
    it "should have a version" do
      refute_nil ::KaminariApiMetaData::VERSION
    end

    describe "methods" do
      before do
        @dummy = Dummy.new
      end

      describe "#meta_data(collection, extra_meta = {})" do
        before do
          @collection = mock("Collection")
          @collection.expects(:current_page).returns(1)
          @collection.expects(:next_page).returns(2)
          @collection.expects(:limit_value).returns(20)
          @collection.expects(:prev_page).returns(nil)
          @collection.expects(:total_pages).returns(10)
          @collection.expects(:total_count).returns(23)
        end

        describe "with no extra meta data" do
          before do
            @expected = {
              current_page: 1,
              next_page: 2,
              per_page: 20,
              prev_page: nil,
              total_pages: 10,
              total_count: 23
            }
          end

          it "should return meta attributes" do
            assert_equal @expected, @dummy.meta_data(@collection)
          end
        end

        describe "with extra meta data" do
          before do
            @expected = {
              current_page: 1,
              next_page: 2,
              per_page: 20,
              prev_page: nil,
              total_pages: 10,
              total_count: 23,
              foo: "bar"
            }
          end

          it "should return meta attributes" do
            assert_equal @expected, @dummy.meta_data(@collection, foo: "bar")
          end
        end
      end
    end
  end
end
