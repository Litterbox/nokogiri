require('nokogiri')
require('open-uri')
# require('awesome_print')
# require('sinatra')
# require('sinatra/reloader')
# require('json')

def parse_nokogiri(item)
  {artist: item.css(".cell1").text,
   venue: item.css(".cell2").text,
   date: item.css(".cell0").text }
end

html = "index.html"
data = Nokogiri::HTML(open(html).read)
search = ARGV[0]

# get "/:artist" do
# search = params[:artist]
result = data.css("tbody tr").map {|item| parse_nokogiri(item)}
result.select!{|item| item[:artist].downcase.include? search.downcase} if search
# result.to_json
# end
# result = data.css("tbody tr").select {|item| item.css('.cell1').text.downcase.include? search.downcase}

# data.css("tbody tr").each_with_index do |row,index|
#   puts index
#   puts row.css(".cell1").text
#   puts row.css(".cell2").text
#   puts "*"*60
# end

p result