# frozen_string_literal: true

require 'pry-byebug'
# This class will Load the data from the Log.
class LoadLogData
  REGEX_FORMAT = %r(\A\/\w+\/?\d*\s\d{1,3}.{1}\d{1,33}.{1}\d{1,3}.{1}\d{1,3}).freeze

  def initialize(filename)
    @file = File.open(filename)
  end

  def data_loader
    data = []
    batch_size = 1000

    @file.each("\n").lazy.each_slice(batch_size) do |batch|
      batch_to_insert = batch.map { |l| l if l.match?(REGEX_FORMAT) }
      data << batch_to_insert
    end
    @file.close
    data.flatten
  end
end
