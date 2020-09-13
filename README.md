Code was written in Ruby 2.7.1

To run the script, run:
`ruby script/webserver_parser.rb <path/to/webserver.log`
This will then produce an output with the following from most to least:
* visits per page
* unique views per page

Further actionpoints (that would need clarification if needed):
* show rejected pages/lines
*currently the sort is based purely on the numeric value from the page visit or the unique views. If the customer would like more to be done with the sorting this would need to be discussed.
