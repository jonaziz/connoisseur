# Create HTML outputs for show and index functions
class HtmlGenerator

  # looking up a particular product
  def show
    print_header
    puts "    Action: show"
    print_footer
  end

  # outputting a listing of items
  def index
    print_header
    puts "    Action: index"
    print_footer
  end

  # below is only available to methods within class
  private

  # opening HTML code
  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
   end

  # closing HTML code
  def print_footer
    puts "  </body>"
    puts "</html>"
  end

end