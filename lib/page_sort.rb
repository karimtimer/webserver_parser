# frozen_string_literal: true

# This class will sort the pages by the type they are.
class PageSort
  def initialize(data_hash)
    @data_hash = data_hash
  end

  def sort_by_type
    @data_hash.sort_by { |_k, v| v }.reverse.to_h
  end
end
