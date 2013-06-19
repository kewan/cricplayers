require 'nokogiri'
require 'open-uri'

base_url = "http://www.espncricinfo.com/australia/content/player/"

doc = Nokogiri::HTML(open(base_url))

doc.css('li.ctrytab a').each do |link|
  puts link.content

  country_url = "#{base_url}#{link.attr('href').to_s}"
  # each contry payers page
  country_doc = Nokogiri::HTML(open(country_url))

  country_doc.css('table.playersTable td a').each do |player_link|
    puts player_link.content
  end
end
