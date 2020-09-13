# frozen_string_literal: true
require 'set'

module Parsable
  def log_parser row
    page, ip_address = row.split(' ')
    if page_visits.key?(page)
      page_visits[page] += 1
      unique_views[page] << ip_address
    else
      initial_page_encounter(page, ip_address)
    end
  end

  def initial_page_encounter page, ip_address
    page_visits.store(page, 1)
    ip_addresses = Set.new
    ip_addresses << ip_address 
    unique_views.store(page, ip_addresses)
  end
end
