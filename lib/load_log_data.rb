# frozen_string_literal: true

# This class will Load the data from the Log.
class LoadLogData
  def initialize(file_path)
    @file_path = file_path
  end

  def data_loader
    file = File.open(@file_path)
    file_data = file.readlines.map(&:chomp)
    file.close
    file_data
  end
end
