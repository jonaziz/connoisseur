require_relative 'html_generator'

# Access parameters passed into the app
# On command-line, we can pass in parameters like with methods
# See help documentation for each command

# How do we do this? Argument Vector (anything in ruby has access to this)
# Functions like an array
# If you fail to provide argument, it will printout help on what to do

if ARGV.empty? #there are no arguments provide
	puts "USAGE: requires arguments"
  puts "OPTIONS:"
  puts "   index comand shows product list"
  puts "   show command shows product by id"
  puts "DISPLAY:"
  puts "   put into file (ex. \"> index.html\") and"
  puts "   launch the file to see the list."
  puts "SAMPLE:"
  puts "   ruby router.rb index > index.html"
else
  generator = HtmlGenerator.new

	if ARGV[0] == "index"
		generator.index
	elsif ARGV[0] == "show"
    id = ARGV[1]
		generator.show(id)
	else
		puts "Unrecognized command. Please refer to USAGE"
    puts "by entering the command \"ruby router.rb\""
	end
end