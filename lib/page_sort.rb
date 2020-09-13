class PageSort
  def initialize data_hash
    @data_hash = data_hash
  end

  def sort_by_type sort_type
    @data_hash.sort_by {|k,v| v}.reverse.to_h
  end
end
