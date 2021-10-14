require 'rubygems'
require 'nokogiri'
require 'open-uri' 

# Les élements de base
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

# Les noms de devises crypto-monnaies mises dans un array
def currency_names(page)
  crypto_names = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]/div')

  crypto_names_array = []

  crypto_names.each do |crypto_name|
    crypto_names_array << crypto_name.text
  end
  return crypto_names_array
end

# Les prix des devises crypto-monnaies mises dans un array
def currency_prices(page)
  crypto_prices = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/div')

  crypto_prices_array = []
  crypto_prices.each do |crypto_price|
    crypto_prices_array << crypto_price.text.delete("$,").to_f
  end
return crypto_prices_array
end

# Méthode une array qui prend en compte les deux hash : les noms de devises et les prix.
def array_of_hashes(crypto_names_array, crypto_prices_array)
  ar = []
  crypto_prices_array.length.times do |i|
    ar << {crypto_names_array[i] => crypto_prices_array[i]}
  end
  return ar
end

# Méthode pour scrapper les crypto-monnaies
def crypto_scrapper(page)
  currency_names(page)
  currency_prices(page)
  return array_of_hashes(currency_names(page), currency_prices(page))
end

# Pour afficher : 
# puts crypto_scrapper