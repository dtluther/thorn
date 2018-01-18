# Write code that scrapes the page https://www.wearethorn.org/resources-and-research
# and outputs the following to STDOUT in JSON format:
#   All links on the page that point to a different page or site (e.g. no "#fragment" links)
#   The title and description for each project on the page (e.g. "Sextortion Survey")

require 'Nokogiri'
require 'HTTParty'
require 'Pry'
require 'json'
require 'byebug'

page = HTTParty.get('https://www.wearethorn.org/resources-and-research')

parsed_page = Nokogiri::HTML(page)

links = []
projects = {}

parsed_page.css('.standard_section')[4..-3].each do |project_section|
    project_section.css('.vc_column-inner').each do |project|
        title = project.css('h4')
        title_text = title.text
        description = project.css('p')
        description_text = description.text

        projects[title_text] = description_text
    end
end

Pry.start(binding)

