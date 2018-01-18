require 'Nokogiri'
require 'HTTParty'
require 'Pry'
require 'JSON'

page = HTTParty.get('https://www.wearethorn.org/resources-and-research')

Pry.start(binding)
