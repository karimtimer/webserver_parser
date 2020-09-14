#!/usr/local/bin/ruby -w
# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)
require '../lib/load_log_data'
require '../lib/parse_log'
require '../lib/populator'
require '../lib/page_sort'
# require 'pry-byebug'

puts 'usage: webserver_parser.rb <path to log file>' unless ARGV[0] && File.file?(ARGV[0])

# load the file data into an array
file_data = LoadLogData.new(ARGV[0]).data_loader
# insantiate a new ParseLog with the file array
parse_log = ParseLog.new(file_data)
# obtain two hashes, one with the page and a visit count, the other with the page and its unique views
page_views, unique_visits = parse_log.data_parser

# sort both hashes
sorted_views = PageSort.new(page_views).sort_by_type
sorted_uniques = PageSort.new(unique_visits).sort_by_type

# instatiate a new populator
populate = Populator.new

# populate both arrays for output
visits_per_page = populate.output_array(sorted_views, 'visits')
unique_views = populate.output_array(sorted_uniques, 'views')

puts '+--- Vists Per Page (Most -> Least) ----+'
pp visits_per_page
puts '+--- unique Views Per Page (Most -> Least) ----+'
pp unique_views
