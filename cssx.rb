require "nokogiri"
require "css_parser"

docs = []
allClasses = []
goodClasses = []
allIds = []
goodIds = []

# for now, pass in 1 html doc and 1 css doc 
ARGV.each do |f|
  docs << f
end

# puts html.inspect

html = Nokogiri::HTML(open(docs[0]))

# loops through document and puts all elements into an array
html.css("*").each do |a|
  allClasses << a.attr('class')
  allIds << a.attr('id')
end

allClasses = allClasses.compact
allIds = allIds.compact

parser = CssParser::Parser.new
parser.load_uri!(docs[1])

allClasses.each do |s|
  declaration = []
  declaration << "." + s + " { " << parser.find_by_selector("." + s) << " }"
  goodClasses << declaration.join
end  

allIds.each do |i|
  declaration = []
  declaration << "#" + i + " { " << parser.find_by_selector("#" + i) << " }"
  goodIds << declaration.join
end

output = goodClasses.uniq + goodIds.uniq


File.open("newStyles.css", 'w') { |file| file.puts(output) }