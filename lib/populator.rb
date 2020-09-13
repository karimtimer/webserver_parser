class Populator
  def initialize
    @visits_per_page = []
    @unique_views = []
  end

  def output_array data_hash, end_bit
    output = []
    data_hash.map do |page, details|
      output << "#{page} #{details} " + end_bit
    end
    output
  end
end
