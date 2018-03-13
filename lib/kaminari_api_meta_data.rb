require "kaminari_api_meta_data/version"

module KaminariApiMetaData
  def meta_data(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      per_page: collection.limit_value,
      prev_page: collection.prev_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }.merge(extra_meta)
  end
end
