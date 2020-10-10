#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require '../lib/load_log_data'
require '../lib/parse_log'
require '../lib/populator'
require '../lib/page_sort'

unless ARGV[0] && File.exist?(ARGV[0])
  puts 'usage: webserver_parser.rb <path to log file>'
  exit
end

file_data = LoadLogData.new(ARGV[0]).data_loader
page_views, unique_visits = ParseLog.new(file_data).data_parser
Populator.new(page_views, unique_visits).output
