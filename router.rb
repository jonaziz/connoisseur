# Access parameters passed into the app
# On command-line, we can pass in parameters like with methods
# See help documentation for each command

# How do we do this? Argument Vector (anything in ruby has access to this)
# Functions like an array
# If you fail to provide argument, it will printout help on what to do

if ARGV.empty? #there are no arguments provide
	puts "USAGE: requires arguments"
else
	puts "Correctly used arguments"

	if ARGV[0] == "index"
		puts "Coming soon"
	elsif ARGV[0] == "show"
		puts "Coming soon"
	else
		puts "Unrecognized command"
	end
end