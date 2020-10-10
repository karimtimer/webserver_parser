# Webserver Parser

The aim of this webserver parser is to have a script that will return two lists, with the following from most to least:
* visits per page
* unique views per page

# Requirements

- [RVM](http://rvm.io/)
- [Ruby 2.7.1](https://www.ruby-lang.org/en/news/2019/04/17/ruby-2-6-3-released/)
- [Git](https://git-scm.com/)

# Installation

- Clone/download this repository locally, then run `$ bundle install`

# Usage

run the following the view output in a terminal window
```bash
$ ./script/webserver_parser.rb webserver.log
```
# Run Rspec tests
- `$ bundle exec rspec` to run the whole test suite

# Additional notes

- this project was written using TDD, and following OOP principles

The terminal output will be shown as:

```
+----------------------------------------------+
+------ Vists Per Page (Most -> Least) --------+
Page                          visits
/about/2                        90
/contact                        89
/index                          82
/about                          81
/help_page/1                    80
/home                           78
+----------------------------------------------+
+--- unique Views Per Page (Most -> Least) ----+
Page                          unique views
/index                          23
/home                           23
/contact                        23
/help_page/1                    23
/about/2                        22
/about                          21
```

# Further actionpoints (that would need clarification):
* show rejected pages/lines
* currently the sort is based purely on the numeric value from the page visit or the unique views. If the customer would like more to be done with the sorting this would need to be discussed.
