class HtmlGenerator

  def show
    print_header
    puts "    Action: show"
    print_footer
  end

  def index
    print_header
    puts "    Action: index"
    print_footer
  end

  # below is only available to methods within class
  private

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
   end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

end