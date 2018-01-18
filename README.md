# Thorn Coding Challenge
## Instructions
* NOTE: This script is run in Ruby, so make sure to have Ruby installed on your computer.
1) Either download the repo or clone the repo into by running `git clone https://github.com/dtluther/thorn.git` in your terminal. Next, run `cd thorn` to navigate into the directory so that the following instructions work.
2) Run `bundle install` to install the Ruby gems.
3) There are two options to run the script:
    * If you do not care how the JSON output looks in the terminal, just run `ruby scraper.rb`
    * If you want a formatted output, do the following steps in order:
        1) Run `ruby pretty_scrape.rb`
        2) Run `ruby -e "require 'json'; puts JSON.pretty_generate(JSON.parse(ARGF.read))" pretty_output.json`

