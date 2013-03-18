# Access parameters passed into the app
# On command-line, we can pass in parameters like with methods
# See help documentation for each command

# How do we do this? Argument Vector (anything in ruby has access to this)
# Functions like an array
puts ARGV[0].inspect
puts ARGV[1].inspect
puts ARGV[2].inspect