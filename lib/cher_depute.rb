require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Les éléments de base
page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/tableau'))