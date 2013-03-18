require "open-uri"
require "json"

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

    products = retrieve_data
    products.each do |product|
      display_product(product)
    end

    print_footer
  end

  # below is only available to methods within class
  private

  def display_product(product)
    puts "    <p>#{product['name']}</p>"
  end

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

  # retrieving data
  def retrieve_data
    response = open("http://lcboapi.com/products.json").read
    data = JSON.parse(response)

    return data["result"]
  end

end