class LoadLogData
  def initialize file_path
    @file_path = file_path
  end

  def data_loader
    file = File.open(@file_path)
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
  end
end
