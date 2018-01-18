# Write code that scrapes the page https://www.wearethorn.org/resources-and-research
# and outputs the following to STDOUT in JSON format:
#   All links on the page that point to a different page or site (e.g. no "#fragment" links)
#   The title and description for each project on the page (e.g. "Sextortion Survey")

require 'Nokogiri'
require 'HTTParty'
require 'Pry'
require 'json'

# Load and parse the page
page = HTTParty.get('https://www.wearethorn.org/resources-and-research')
parsed_page = Nokogiri::HTML(page)

links = []
projects = {}

# Locate the projects
parsed_page.css('.standard_section')[4..-3].each do |project_section|
    project_section.css('.vc_column-inner').each do |project|
        title = project.css('h4')
        title_text = title.text
        description = project.css('p')
        description_text = description.text

        projects[title_text] = description_text
    end
end

# Get the links that don't have '#' at the beginning of the `href` tag
parsed_page.css('a').each do |link|
    next unless link["href"]
    unless link["href"][0] == "#"
        full_link = link["href"][0] == "/" ? "https://www.wearethorn.org#{link['href']}" : link["href"]

        links << full_link
    end
end

# Put everything in a JSON constant that can be accessed in another file if necessary
JOINED = { links: links, projects: projects}.to_json

# Only print JOINED to STDOUt if this file is directly run, not if required by `pretty_scrape.rb`
if __FILE__ == $0
    puts JOINED
end