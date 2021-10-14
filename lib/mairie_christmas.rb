require 'rubygems'
require 'nokogiri'
require 'open-uri' 

# Les éléments de base
page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))


