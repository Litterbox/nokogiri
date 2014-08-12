require 'nokogiri'
require 'open-uri'
require 'slop'


# Slop.parse do
#   on "-d", "--define" do
    url = "http://www.urbandictionary.com/define.php?term=#{ARGV[0]}"
    d = Nokogiri::HTML(open(url))
    # puts d
    puts d.css(".meaning").first.text.strip
#   end

#   command
# end


