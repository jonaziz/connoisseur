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
      display_product_info(product)
    end

    print_footer
  end

  # below is only available to methods within class
  private

  def display_product(product)
    puts "      <h2>#{product['name']}</h2>"
  end

  def display_product_info(product)
    puts "      <ul>"
    puts "        <li>Product ID: #{product['id']}</li>"
    puts "        <li>Producer: #{product['producer_name']}</li>"
    puts "        <li>Category: #{product['primary_category']}</li>"
    puts "        <li>Sub-category: #{product['secondary_category']}</li>"
    puts "        <li>Volume Sold: #{product['package_unit_volume_in_milliliters']} ml</li>"
    puts "        <li>Price: $#{(product['price_in_cents'].to_i/100.0)}</li>"
    puts "      </ul>"
    puts "      <img src='#{product['image_thumb_url']}'>"
  end

  # opening HTML code
  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
    puts "    <h1>Product Listing</h1>"
    puts "    <br />"
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