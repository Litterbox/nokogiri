require 'nokogiri'
require 'open-uri'
require 'json'
require 'awesome_print'

url= "https://news.ycombinator.com/"
page = Nokogiri::HTML(open(url).read)
results = []

page.css(".title a").each do |link|

  results.push({
    name: link.text,
    url: link["href"]
    })

  # puts link.text
  # puts link.text
  # puts link.attributes["href"]
  # puts "*"*20

end

ap results
# puts JSON.pretty_generate(results)