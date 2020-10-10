# frozen_string_literal: true

# This populates an array with string arrays
class Populator
  def initialize(page_views, unique_visits)
    @sorted_views = PageSort.new(page_views).sort_by_type
    @sorted_uniques = PageSort.new(unique_visits).sort_by_type
  end

  def output
    puts '+----------------------------------------------+'
    puts '+------ Vists Per Page (Most -> Least) --------+'
    puts 'Page'.ljust(30) + 'visits'
    print_row(@sorted_views)
    puts '+----------------------------------------------+'
    puts '+--- unique Views Per Page (Most -> Least) ----+'
    puts 'Page'.ljust(30) + 'unique views'
    print_row(@sorted_uniques)
  end

  def print_row(sorted_data)
    output_for_type(sorted_data).each { |line| puts line }
  end

  def output_for_type(sorted_data)
    output = []
    sorted_data.map do |page, details|
      output << page.ljust(32) + details.to_s
    end
    output
  end
end
