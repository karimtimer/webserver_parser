# frozen_string_literal: true

require_relative 'module/parsable'

# This class initializes with an array of file data, then parses this data
class ParseLog
  include Parsable
  attr_accessor :page_visits, :unique_views

  def initialize(file_data)
    @page_visits = {}
    @unique_views = {}
    @file_data = file_data
  end

  def data_parser
    @file_data.map { |line| log_parser(line) }
    @unique_views = @unique_views.map { |k, v| [k, v.count] }.to_h
    [@page_visits, @unique_views]
  end
end
